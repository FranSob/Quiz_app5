import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/progress_ring.dart';
import 'chapter_detail_screen.dart';
import 'chapter_list_screen.dart';
import 'flashcards_home_screen.dart';
import 'flashcards_screen.dart';
import 'theory_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final classData = classByLevel(state.selectedClassLevel);
    final continueTopic = state.continueTopic;
    final continueChapter = continueTopic != null ? chapterOfTopic(continueTopic.id) : null;
    final dueCount = state.dueFlashcardsCount(classLevel: state.selectedClassLevel);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Cześć', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  Text('Klasa ${state.selectedClassLevel} liceum',
                      style: const TextStyle(color: AppColors.textMuted, fontSize: 14)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Poziom ${state.level} · ${state.totalXp} XP',
                    style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 6),
                SizedBox(
                  width: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: state.xpIntoLevel / state.xpForNextLevel,
                      minHeight: 6,
                      backgroundColor: AppColors.darkBorder,
                      color: AppColors.green,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        if (continueTopic != null && continueChapter != null)
          AppCard(
            color: AppColors.greenBanner,
            borderColor: Colors.transparent,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => TheoryScreen(topic: continueTopic),
            )),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.green.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.chevron_right_rounded, color: AppColors.green),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('KONTYNUUJ NAUKĘ',
                          style: TextStyle(color: AppColors.green, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                      const SizedBox(height: 2),
                      Text(continueTopic.name,
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text(continueChapter.name, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _ActionButton(
                icon: Icons.description_outlined,
                label: 'TESTY',
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const ChapterListScreen(mode: ChapterListMode.quiz),
                )),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _ActionButton(
                icon: Icons.style_outlined,
                label: 'FISZKI',
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const FlashcardsHomeScreen(),
                )),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _ActionButton(
                icon: Icons.view_column_outlined,
                label: 'TEORIA',
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const ChapterListScreen(mode: ChapterListMode.theory),
                )),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        AppCard(
          color: AppColors.greenDark.withValues(alpha: 0.35),
          borderColor: Colors.transparent,
          onTap: () {
            final cards = state.dueFlashcards(classLevel: state.selectedClassLevel);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => FlashcardsScreen(cards: cards, title: 'Powtórka fiszek'),
            ));
          },
          child: Row(
            children: [
              Expanded(
                child: Text('Do powtórki dziś: $dueCount',
                    style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              const Icon(Icons.chevron_right_rounded, color: AppColors.green),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _ClassTabs(state: state),
        const SizedBox(height: 20),
        const Text('DZIAŁY', style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 13)),
        const SizedBox(height: 10),
        ...classData.chapters.map((chapter) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AppCard(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ChapterDetailScreen(chapter: chapter),
                )),
                child: Row(
                  children: [
                    ProgressRing(percent: state.chapterProgressPercent(chapter), size: 40),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(chapter.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('${chapter.topicCount} ${chapter.topicCount == 1 ? 'temat' : 'tematy'}',
                              style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(vertical: 18),
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: AppColors.green, size: 26),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0.5)),
        ],
      ),
    );
  }
}

class _ClassTabs extends StatelessWidget {
  final AppState state;
  const _ClassTabs({required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(4, (i) {
        final level = i + 1;
        final selected = state.selectedClassLevel == level;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: level == 4 ? 0 : 8),
            child: GestureDetector(
              onTap: () => state.setSelectedClassLevel(level),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selected ? AppColors.green : AppColors.darkCard,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: selected ? AppColors.green : AppColors.darkBorder),
                ),
                child: Center(
                  child: Text('Kl. $level',
                      style: TextStyle(
                        color: selected ? Colors.black : AppColors.textMuted,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
