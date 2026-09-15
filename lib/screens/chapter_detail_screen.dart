import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/notes_export_sheet.dart';
import '../widgets/progress_ring.dart';
import 'flashcards_screen.dart';
import 'quiz_screen.dart';
import 'theory_screen.dart';

class ChapterDetailScreen extends StatelessWidget {
  final Chapter chapter;
  const ChapterDetailScreen({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.name),
        actions: [
          IconButton(
            tooltip: 'Notatki z działu (PDF)',
            icon: const Icon(Icons.print_outlined),
            onPressed: () => showNotesExportSheet(
              context,
              title: chapter.name,
              subtitle: 'Notatki z działu',
              topics: chapter.topics,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppCard(
            onTap: chapter.allQuestions.isEmpty
                ? null
                : () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => QuizScreen(
                        chapterId: chapter.id,
                        title: 'Test — ${chapter.name}',
                        items: chapter.topics
                            .expand((t) => t.questions.map((q) => QuizItem(question: q, topicId: t.id)))
                            .toList(),
                      ),
                    )),
            child: Row(
              children: [
                const Icon(Icons.bolt_rounded, color: AppColors.green),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text('Testuj cały dział', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('TEMATY', style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 13)),
          const SizedBox(height: 10),
          ...chapter.topics.map((topic) {
            final acc = state.topicAccuracy(topic.id);
            final answered = state.topicAnsweredCount(topic.id);
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(topic.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                        if (answered > 0) ProgressRing(percent: acc, size: 32),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _MiniButton(
                            icon: Icons.view_column_outlined,
                            label: 'Teoria',
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => TheoryScreen(topic: topic),
                            )),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _MiniButton(
                            icon: Icons.style_outlined,
                            label: 'Fiszki',
                            onTap: topic.flashcards.isEmpty
                                ? null
                                : () => Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => FlashcardsScreen(cards: topic.flashcards, title: topic.name),
                                    )),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _MiniButton(
                            icon: Icons.description_outlined,
                            label: 'Test',
                            onTap: topic.questions.isEmpty
                                ? null
                                : () => Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => QuizScreen(
                                        chapterId: chapter.id,
                                        title: topic.name,
                                        items: topic.questions.map((q) => QuizItem(question: q, topicId: topic.id)).toList(),
                                      ),
                                    )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _MiniButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _MiniButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null;
    return Material(
      color: disabled ? AppColors.darkCardAlt.withValues(alpha: 0.4) : AppColors.darkCardAlt,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Icon(icon, size: 18, color: disabled ? AppColors.textMuted : AppColors.green),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(fontSize: 11, color: disabled ? AppColors.textMuted : Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
