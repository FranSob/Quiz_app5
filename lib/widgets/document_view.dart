import 'package:flutter/material.dart';

import '../theme.dart';

/// Lekki widok dokumentów tekstowych (Markdown w zakresie, którego używamy:
/// nagłówki, listy, tabele, pogrubienia i odnośniki).
class DocumentView extends StatelessWidget {
  final String text;

  const DocumentView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    for (final rawLine in text.split('\n')) {
      final line = rawLine.trimRight();
      if (line.trim().isEmpty) {
        widgets.add(const SizedBox(height: 10));
        continue;
      }
      if (line.startsWith('# ')) {
        widgets.add(Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(_inline(line.substring(2)), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ));
      } else if (line.startsWith('## ')) {
        widgets.add(Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 4),
          child: Text(_inline(line.substring(3)),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.green)),
        ));
      } else if (line.startsWith('- ')) {
        widgets.add(Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('•  ', style: TextStyle(fontSize: 14, height: 1.5)),
              Expanded(child: Text(_inline(line.substring(2)), style: const TextStyle(fontSize: 14, height: 1.5))),
            ],
          ),
        ));
      } else if (line.startsWith('|')) {
        // Wiersz tabeli; linię z myślnikami pomijamy.
        final cells = line.split('|').map((c) => c.trim()).where((c) => c.isNotEmpty).toList();
        if (cells.every((c) => RegExp(r'^:?-{2,}:?$').hasMatch(c))) continue;
        widgets.add(Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            cells.map(_inline).join('  ·  '),
            style: const TextStyle(fontSize: 13.5, height: 1.5),
          ),
        ));
      } else {
        widgets.add(Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(_inline(line), style: const TextStyle(fontSize: 14, height: 1.5)),
        ));
      }
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
  }

  /// Usuwa znaczniki, których nie renderujemy: **pogrubienie** i [odnośnik](cel).
  static String _inline(String text) => text
      .replaceAllMapped(RegExp(r'\[([^\]]+)\]\(([^)]+)\)'), (m) => m[1]!)
      .replaceAll('**', '');
}
