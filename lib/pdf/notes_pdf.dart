import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../models.dart';
import '../utils/theory_sections.dart';

class NotesFonts {
  final pw.Font regular;
  final pw.Font bold;

  /// Czcionka zapasowa ze znakami, których brakuje w Noto Sans (np. → i ≈).
  final pw.Font symbols;

  const NotesFonts({required this.regular, required this.bold, required this.symbols});
}

const notesRegularFontAsset = 'assets/fonts/NotoSans-Regular.ttf';
const notesBoldFontAsset = 'assets/fonts/NotoSans-Bold.ttf';
const notesSymbolsFontAsset = 'assets/fonts/NotoSansMath-Regular.ttf';

Future<NotesFonts> loadNotesFonts() async {
  final regular = await rootBundle.load(notesRegularFontAsset);
  final bold = await rootBundle.load(notesBoldFontAsset);
  final symbols = await rootBundle.load(notesSymbolsFontAsset);
  return NotesFonts(regular: pw.Font.ttf(regular), bold: pw.Font.ttf(bold), symbols: pw.Font.ttf(symbols));
}

final _green = PdfColor.fromHex('#1F8F5F');
final _muted = PdfColor.fromHex('#5F6B7A');
final _border = PdfColor.fromHex('#D5DAE0');
final _headerFill = PdfColor.fromHex('#EAF6F0');

const _letters = ['a', 'b', 'c', 'd', 'e', 'f'];

/// Pytanie z przemieszaną kolejnością odpowiedzi. Kolejność zależy od id
/// pytania, więc ten sam temat daje zawsze ten sam wydruk, a poprawna
/// odpowiedź nie stoi ciągle na tej samej pozycji.
class _PrintedQuestion {
  final QuizQuestion question;
  final List<String> options;
  final int correctIndex;

  _PrintedQuestion(this.question, this.options, this.correctIndex);

  factory _PrintedQuestion.from(QuizQuestion q) {
    final seed = q.id.codeUnits.fold<int>(17, (h, c) => (h * 31 + c) & 0x7fffffff);
    final order = List<int>.generate(q.options.length, (i) => i)..shuffle(Random(seed));
    return _PrintedQuestion(q, [for (final i in order) q.options[i]], order.indexOf(q.correctIndex));
  }
}

/// Buduje notatki do druku: teorię, opcjonalnie fiszki i test z kluczem.
Future<Uint8List> buildNotesPdf({
  required String title,
  String? subtitle,
  required List<Topic> topics,
  required NotesFonts fonts,
  bool includeFlashcards = true,
  bool includeTest = false,
}) async {
  final doc = pw.Document(
    title: title,
    author: 'BioMatura',
    theme: pw.ThemeData.withFont(base: fonts.regular, bold: fonts.bold, fontFallback: [fonts.symbols]),
  );

  final printedQuestions = <MapEntry<Topic, List<_PrintedQuestion>>>[
    if (includeTest)
      for (final t in topics)
        if (t.questions.isNotEmpty) MapEntry(t, t.questions.map(_PrintedQuestion.from).toList()),
  ];

  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(42, 40, 42, 36),
      footer: (context) => pw.Container(
        alignment: pw.Alignment.centerRight,
        margin: const pw.EdgeInsets.only(top: 8),
        child: pw.Text(
          'BioMatura · strona ${context.pageNumber} z ${context.pagesCount}',
          style: pw.TextStyle(fontSize: 8, color: _muted),
        ),
      ),
      build: (context) => [
        pw.Text(title, style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold, color: _green)),
        if (subtitle != null) ...[
          pw.SizedBox(height: 2),
          pw.Text(subtitle, style: pw.TextStyle(fontSize: 11, color: _muted)),
        ],
        pw.SizedBox(height: 14),
        for (final topic in topics) ..._topicWidgets(topic, includeFlashcards, topics.length > 1),
        if (printedQuestions.isNotEmpty) ..._testWidgets(printedQuestions),
      ],
    ),
  );
  return doc.save();
}

List<pw.Widget> _topicWidgets(Topic topic, bool includeFlashcards, bool showTopicTitle) {
  return [
    if (showTopicTitle) ...[
      pw.Container(
        width: double.infinity,
        padding: const pw.EdgeInsets.only(bottom: 4),
        margin: const pw.EdgeInsets.only(top: 6, bottom: 8),
        decoration: pw.BoxDecoration(border: pw.Border(bottom: pw.BorderSide(color: _green, width: 1.2))),
        child: pw.Text(topic.name, style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold)),
      ),
    ],
    for (final section in parseTheorySections(topic.theory)) ...[
      if (section.heading != null)
        pw.Padding(
          padding: const pw.EdgeInsets.only(top: 4, bottom: 3),
          child: pw.Text(section.heading!,
              style: pw.TextStyle(fontSize: 10.5, fontWeight: pw.FontWeight.bold, color: _green)),
        ),
      for (final paragraph in section.body.split('\n'))
        if (paragraph.trim().isNotEmpty)
          pw.Paragraph(
            text: paragraph.trim(),
            style: const pw.TextStyle(fontSize: 10, lineSpacing: 2),
            margin: const pw.EdgeInsets.only(bottom: 5),
          ),
      pw.SizedBox(height: 3),
    ],
    if (includeFlashcards && topic.flashcards.isNotEmpty) ...[
      pw.Padding(
        padding: const pw.EdgeInsets.only(top: 6, bottom: 5),
        child: pw.Text('Pytania do powtórki (fiszki)',
            style: pw.TextStyle(fontSize: 11.5, fontWeight: pw.FontWeight.bold)),
      ),
      pw.Table(
        border: pw.TableBorder.all(color: _border, width: 0.6),
        columnWidths: const {0: pw.FlexColumnWidth(1), 1: pw.FlexColumnWidth(1.25)},
        children: [
          pw.TableRow(
            decoration: pw.BoxDecoration(color: _headerFill),
            children: [_cell('Pytanie', bold: true), _cell('Odpowiedź', bold: true)],
          ),
          for (final card in topic.flashcards) pw.TableRow(children: [_cell(card.front), _cell(card.back)]),
        ],
      ),
    ],
    pw.SizedBox(height: 12),
  ];
}

List<pw.Widget> _testWidgets(List<MapEntry<Topic, List<_PrintedQuestion>>> groups) {
  final widgets = <pw.Widget>[
    pw.NewPage(),
    pw.Text('Test sprawdzający', style: pw.TextStyle(fontSize: 17, fontWeight: pw.FontWeight.bold, color: _green)),
    pw.SizedBox(height: 2),
    pw.Text('Zaznacz jedną poprawną odpowiedź. Klucz znajdziesz na końcu.',
        style: pw.TextStyle(fontSize: 9.5, color: _muted)),
    pw.SizedBox(height: 10),
  ];
  var number = 0;
  final key = <pw.Widget>[];
  for (final group in groups) {
    if (groups.length > 1) {
      widgets.add(pw.Padding(
        padding: const pw.EdgeInsets.only(top: 4, bottom: 6),
        child: pw.Text(group.key.name, style: pw.TextStyle(fontSize: 11.5, fontWeight: pw.FontWeight.bold)),
      ));
    }
    for (final pq in group.value) {
      number++;
      widgets.add(pw.Padding(
        padding: const pw.EdgeInsets.only(bottom: 8),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('$number. ${pq.question.question}', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 2),
            for (var i = 0; i < pq.options.length; i++)
              pw.Padding(
                padding: const pw.EdgeInsets.only(left: 12, top: 1),
                child: pw.Text('${_letters[i]}) ${pq.options[i]}', style: const pw.TextStyle(fontSize: 10)),
              ),
          ],
        ),
      ));
      key.add(pw.Padding(
        padding: const pw.EdgeInsets.only(bottom: 3),
        child: pw.Text('$number. ${_letters[pq.correctIndex]}) ${pq.question.explanation}',
            style: const pw.TextStyle(fontSize: 9)),
      ));
    }
  }
  widgets
    ..add(pw.NewPage())
    ..add(pw.Text('Klucz odpowiedzi', style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold, color: _green)))
    ..add(pw.SizedBox(height: 8))
    ..addAll(key);
  return widgets;
}

pw.Widget _cell(String text, {bool bold = false}) => pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      child: pw.Text(text,
          style: pw.TextStyle(fontSize: 9, fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal)),
    );

const _polishAscii = {
  'ą': 'a', 'ć': 'c', 'ę': 'e', 'ł': 'l', 'ń': 'n', 'ó': 'o', 'ś': 's', 'ź': 'z', 'ż': 'z',
};

/// Nazwa pliku bez polskich znaków i spacji, np. „notatki-bialka.pdf".
String notesFileName(String title) {
  final ascii = title.toLowerCase().split('').map((c) => _polishAscii[c] ?? c).join();
  final slug = ascii.replaceAll(RegExp(r'[^a-z0-9]+'), '-').replaceAll(RegExp(r'^-+|-+$'), '');
  final trimmed = slug.length > 60 ? slug.substring(0, 60).replaceAll(RegExp(r'-+$'), '') : slug;
  return 'notatki-${trimmed.isEmpty ? 'biologia' : trimmed}.pdf';
}
