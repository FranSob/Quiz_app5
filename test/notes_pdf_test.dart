import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:biomatura/data/biology_data.dart';
import 'package:biomatura/pdf/notes_pdf.dart';
import 'package:biomatura/utils/theory_sections.dart';

ByteData _fontBytes(String asset) => ByteData.sublistView(File(asset).readAsBytesSync());

NotesFonts _fonts() => NotesFonts(
      regular: pw.Font.ttf(_fontBytes(notesRegularFontAsset)),
      bold: pw.Font.ttf(_fontBytes(notesBoldFontAsset)),
      symbols: pw.Font.ttf(_fontBytes(notesSymbolsFontAsset)),
    );

void main() {
  test('the PDF fonts have a glyph for every character used in the notes', () {
    final buffer = StringBuffer();
    for (final chapter in allChapters) {
      buffer.write(chapter.name);
      for (final topic in chapter.topics) {
        buffer
          ..write(topic.name)
          ..write(topic.theory);
        for (final card in topic.flashcards) {
          buffer
            ..write(card.front)
            ..write(card.back);
        }
        for (final q in topic.questions) {
          buffer
            ..write(q.question)
            ..writeAll(q.options)
            ..write(q.explanation);
        }
      }
    }
    final symbols = TtfParser(_fontBytes(notesSymbolsFontAsset));
    for (final asset in [notesRegularFontAsset, notesBoldFontAsset]) {
      final parser = TtfParser(_fontBytes(asset));
      final missing = buffer.toString().runes.toSet().where((r) =>
          r > 32 &&
          !parser.charToGlyphIndexMap.containsKey(r) &&
          !symbols.charToGlyphIndexMap.containsKey(r));
      expect(missing.map(String.fromCharCode), isEmpty, reason: asset);
    }
  });

  test('builds a chapter PDF with flashcards and a test with answer key', () async {
    final chapter = allChapters.firstWhere((c) => c.id == 'k3_krazenie');
    final bytes = await buildNotesPdf(
      title: chapter.name,
      subtitle: 'Notatki z działu',
      topics: chapter.topics,
      fonts: _fonts(),
      includeFlashcards: true,
      includeTest: true,
    );
    expect(String.fromCharCodes(bytes.sublist(0, 5)), '%PDF-');
    expect(bytes.length, greaterThan(20000));
  });

  test('every topic can be exported on its own', () async {
    final fonts = _fonts();
    for (final chapter in allChapters) {
      for (final topic in chapter.topics) {
        final bytes = await buildNotesPdf(
          title: topic.name,
          topics: [topic],
          fonts: fonts,
          includeFlashcards: true,
          includeTest: true,
        );
        expect(bytes, isNotEmpty, reason: topic.id);
      }
    }
  });

  test('theory sections are split into headings and bodies', () {
    final sections = parseTheorySections('NAGŁÓWEK\nTreść pierwszej sekcji.\n\nZwykły akapit bez nagłówka.');
    expect(sections, hasLength(2));
    expect(sections[0].heading, 'NAGŁÓWEK');
    expect(sections[0].body, 'Treść pierwszej sekcji.');
    expect(sections[1].heading, isNull);
    expect(sections[1].body, 'Zwykły akapit bez nagłówka.');
  });

  test('file names have no Polish letters or spaces', () {
    expect(notesFileName('Białka i enzymy'), 'notatki-bialka-i-enzymy.pdf');
    expect(notesFileName('Krążenie — krew, serce'), 'notatki-krazenie-krew-serce.pdf');
    expect(notesFileName('???'), 'notatki-biologia.pdf');
  });
}
