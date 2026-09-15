import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../logic/school_test.dart';
import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../utils/dates.dart';
import '../utils/plurals.dart';
import '../widgets/app_card.dart';
import '../widgets/notes_export_sheet.dart';
import 'quiz_screen.dart';

const _questionCounts = [10, 15, 20, 30];

/// „dziś", „jutro", „za 3 dni"
String daysUntilLabel(int days) {
  if (days == 0) return 'dziś';
  if (days == 1) return 'jutro';
  return 'za $days ${plural(days, 'dzień', 'dni', 'dni')}';
}

String chapterNames(List<String> chapterIds) => [
      for (final id in chapterIds)
        for (final ch in allChapters)
          if (ch.id == id) ch.name,
    ].join(', ');

/// Przygotowanie do sprawdzianu szkolnego z wybranych działów.
class SchoolTestScreen extends StatefulWidget {
  final PlannedTest? initialTest;

  const SchoolTestScreen({super.key, this.initialTest});

  @override
  State<SchoolTestScreen> createState() => _SchoolTestScreenState();
}

class _SchoolTestScreenState extends State<SchoolTestScreen> {
  late int _classLevel;
  final Set<String> _selected = {};
  int _count = 15;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialTest;
    _classLevel = initial?.classLevel ?? context.read<AppState>().selectedClassLevel;
    if (initial != null) _selected.addAll(initial.chapterIds);
  }

  List<Chapter> get _chapters => classByLevel(_classLevel).chapters;

  List<Chapter> get _selectedChapters => _chapters.where((c) => _selected.contains(c.id)).toList();

  List<Topic> get _selectedTopics => _selectedChapters.expand((c) => c.topics).toList();

  int get _availableQuestions => _selectedTopics.fold<int>(0, (s, t) => s + t.questions.length);

  void _loadPlanned(PlannedTest test) {
    setState(() {
      _classLevel = test.classLevel;
      _selected
        ..clear()
        ..addAll(test.chapterIds);
    });
  }

  void _start() {
    final topics = _selectedTopics;
    final items = sampleTestQuestions(topics, _count, Random());
    final names = _selectedChapters.map((c) => c.name).join(', ');
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => QuizScreen(title: 'Sprawdzian — $names', items: items, showSchoolGrade: true),
    ));
  }

  Future<void> _plan() async {
    final state = context.read<AppState>();
    final messenger = ScaffoldMessenger.of(context);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final picked = await showDatePicker(
      context: context,
      initialDate: today.add(const Duration(days: 7)),
      firstDate: today,
      lastDate: DateTime(today.year + 1, today.month, today.day),
      helpText: 'Data sprawdzianu',
    );
    if (picked == null) return;
    state.addPlannedTest(date: picked, classLevel: _classLevel, chapterIds: _selected.toList());
    messenger.showSnackBar(SnackBar(content: Text('Zapisano sprawdzian na ${formatDatePl(picked)}.')));
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final upcoming = state.upcomingPlannedTests;
    final available = _availableQuestions;
    final hasSelection = _selected.isNotEmpty && available > 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Sprawdzian z działu')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Wybierz działy, z których masz sprawdzian. Dostaniesz pytania z każdego tematu, orientacyjną ocenę i listę tematów do powtórki.',
            style: TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: [
              for (var level = 1; level <= 4; level++)
                ChoiceChip(
                  label: Text('Kl. $level'),
                  selected: _classLevel == level,
                  selectedColor: AppColors.green,
                  labelStyle: TextStyle(
                    color: _classLevel == level ? Colors.black : null,
                    fontWeight: FontWeight.bold,
                  ),
                  onSelected: (_) => setState(() {
                    if (_classLevel != level) _selected.clear();
                    _classLevel = level;
                  }),
                ),
            ],
          ),
          const SizedBox(height: 12),
          for (final chapter in _chapters)
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: AppColors.green,
              checkColor: Colors.black,
              value: _selected.contains(chapter.id),
              onChanged: (v) => setState(() => v == true ? _selected.add(chapter.id) : _selected.remove(chapter.id)),
              title: Text(chapter.name, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(
                '${topicsLabel(chapter.topicCount)} · ${chapter.allQuestions.length} ${plural(chapter.allQuestions.length, 'pytanie', 'pytania', 'pytań')}',
                style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
              ),
            ),
          const SizedBox(height: 12),
          const Text('Liczba pytań', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              for (final count in _questionCounts)
                ChoiceChip(
                  label: Text('$count'),
                  selected: _count == count,
                  selectedColor: AppColors.green,
                  labelStyle: TextStyle(color: _count == count ? Colors.black : null, fontWeight: FontWeight.bold),
                  onSelected: (_) => setState(() => _count = count),
                ),
            ],
          ),
          if (_selected.isNotEmpty && available < _count) ...[
            const SizedBox(height: 6),
            Text(
              'W wybranych działach jest $available ${plural(available, 'pytanie', 'pytania', 'pytań')} — sprawdzian obejmie wszystkie.',
              style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
            ),
          ],
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: hasSelection ? _start : null,
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Rozpocznij sprawdzian'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _selected.isEmpty ? null : _plan,
                  icon: const Icon(Icons.event_rounded),
                  label: const Text('Zaplanuj datę'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _selected.isEmpty
                      ? null
                      : () => showNotesExportSheet(
                            context,
                            title: _selectedChapters.map((c) => c.name).join(', '),
                            subtitle: 'Notatki na sprawdzian',
                            topics: _selectedTopics,
                          ),
                  icon: const Icon(Icons.print_outlined),
                  label: const Text('Notatki PDF'),
                ),
              ),
            ],
          ),
          if (upcoming.isNotEmpty) ...[
            const SizedBox(height: 24),
            const Text('ZAPLANOWANE SPRAWDZIANY',
                style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 13)),
            const SizedBox(height: 10),
            for (final test in upcoming)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AppCard(
                  onTap: () => _loadPlanned(test),
                  padding: const EdgeInsets.fromLTRB(16, 12, 4, 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${formatDatePl(parseDateKey(test.dateKey)!)} · ${daysUntilLabel(daysBetween(state.clock(), parseDateKey(test.dateKey)!))}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(height: 2),
                            Text('Kl. ${test.classLevel} · ${chapterNames(test.chapterIds)}',
                                style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: 'Usuń',
                        onPressed: () => state.removePlannedTest(test.id),
                        icon: const Icon(Icons.delete_outline_rounded, color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
