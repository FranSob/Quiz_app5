import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../models.dart';
import '../pdf/notes_pdf.dart';
import '../theme.dart';
import '../utils/plurals.dart';

/// Okno eksportu notatek: wybór zawartości, druk albo zapis do PDF.
Future<void> showNotesExportSheet(
  BuildContext context, {
  required String title,
  String? subtitle,
  required List<Topic> topics,
}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: isDark ? AppColors.darkCard : AppColors.lightCard,
    builder: (_) => _NotesExportSheet(title: title, subtitle: subtitle, topics: topics),
  );
}

class _NotesExportSheet extends StatefulWidget {
  final String title;
  final String? subtitle;
  final List<Topic> topics;

  const _NotesExportSheet({required this.title, required this.subtitle, required this.topics});

  @override
  State<_NotesExportSheet> createState() => _NotesExportSheetState();
}

class _NotesExportSheetState extends State<_NotesExportSheet> {
  bool _flashcards = true;
  bool _test = false;
  bool _busy = false;

  /// Błąd pokazujemy w samym oknie — SnackBar byłby zasłonięty przez okno dolne.
  String? _error;

  bool get _hasQuestions => widget.topics.any((t) => t.questions.isNotEmpty);

  Future<void> _export({required bool print}) async {
    final navigator = Navigator.of(context);
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final fonts = await loadNotesFonts();
      final bytes = await buildNotesPdf(
        title: widget.title,
        subtitle: widget.subtitle,
        topics: widget.topics,
        fonts: fonts,
        includeFlashcards: _flashcards,
        includeTest: _test && _hasQuestions,
      );
      final fileName = notesFileName(widget.title);
      if (print) {
        await Printing.layoutPdf(onLayout: (_) async => bytes, name: fileName);
      } else {
        await Printing.sharePdf(bytes: bytes, filename: fileName);
      }
      if (mounted) navigator.pop();
    } catch (e) {
      debugPrint('Eksport notatek nie powiódł się: $e');
      if (mounted) {
        setState(() {
          _busy = false;
          _error = 'Nie udało się przygotować notatek: $e';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Notatki do druku', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              '${widget.title} · ${topicsLabel(widget.topics.length)}',
              style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: AppColors.green,
              value: _flashcards,
              onChanged: _busy ? null : (v) => setState(() => _flashcards = v),
              title: const Text('Dołącz fiszki'),
              subtitle: const Text('Tabela pytań i odpowiedzi do powtórki'),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: AppColors.green,
              value: _test && _hasQuestions,
              onChanged: _busy || !_hasQuestions ? null : (v) => setState(() => _test = v),
              title: const Text('Dołącz test z kluczem odpowiedzi'),
              subtitle: const Text('Pytania na osobnych stronach, klucz na końcu'),
            ),
            const SizedBox(height: 12),
            if (_busy) ...[
              const LinearProgressIndicator(color: AppColors.green),
              const SizedBox(height: 12),
            ],
            if (_error != null) ...[
              Text(_error!, style: const TextStyle(color: AppColors.red, fontSize: 13)),
              const SizedBox(height: 12),
            ],
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _busy ? null : () => _export(print: false),
                    icon: const Icon(Icons.download_rounded),
                    label: const Text('Zapisz PDF'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _busy ? null : () => _export(print: true),
                    icon: const Icon(Icons.print_rounded),
                    label: const Text('Drukuj'),
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
