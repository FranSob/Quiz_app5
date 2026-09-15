import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../logic/premium.dart';
import '../logic/study_plan.dart';
import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../utils/dates.dart';
import '../widgets/app_card.dart';
import '../utils/plurals.dart';
import '../widgets/progress_ring.dart';
import 'chapter_detail_screen.dart';
import 'chapter_list_screen.dart';
import 'data_tasks_screen.dart';
import 'exam_setup_screen.dart';
import 'flashcards_home_screen.dart';
import 'flashcards_screen.dart';
import 'gaps_screen.dart';
import 'open_questions_screen.dart';
import 'school_test_screen.dart';
import 'study_plan_screen.dart';
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
    final plan = state.todayPlan();
    final gaps = state.topicGaps(limit: 3);
    final upcomingTests = state.upcomingPlannedTests;
    final examLocked = isFeatureLocked(PremiumFeature.mockExam, isPremium: state.isPremium);

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
        _PlanCard(plan: plan),
        const SizedBox(height: 16),
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
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _WideAction(
                icon: Icons.assignment_turned_in_outlined,
                title: 'Sprawdzian',
                subtitle: 'z wybranych działów',
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SchoolTestScreen())),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _WideAction(
                icon: Icons.insert_chart_outlined,
                title: 'Zadania z danymi',
                subtitle: 'wykresy i tabele',
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DataTasksScreen())),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _WideAction(
                icon: Icons.edit_note_rounded,
                title: 'Zadania otwarte',
                subtitle: 'z kluczem odpowiedzi',
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OpenQuestionsScreen())),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _WideAction(
                icon: Icons.timer_outlined,
                title: 'Próbna matura',
                subtitle: examLocked ? 'w Premium' : 'arkusz na czas',
                locked: examLocked,
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ExamSetupScreen())),
              ),
            ),
          ],
        ),
        if (upcomingTests.isNotEmpty) ...[
          const SizedBox(height: 16),
          _UpcomingTestCard(test: upcomingTests.first),
        ],
        if (gaps.isNotEmpty) ...[
          const SizedBox(height: 16),
          _TopGapCard(gaps: gaps),
        ],
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
                          Text(topicsLabel(chapter.topicCount),
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

class _PlanCard extends StatelessWidget {
  final DailyPlan plan;

  const _PlanCard({required this.plan});

  @override
  Widget build(BuildContext context) {
    final summary = plan.summary;
    late final String title;
    late final String subtitle;
    switch (summary.phase) {
      case PlanPhase.noExamDate:
        title = 'Plan nauki do matury';
        subtitle = 'Ustaw datę matury, a rozpiszę materiał na dni.';
      case PlanPhase.examPassed:
        title = 'Plan nauki do matury';
        subtitle = 'Ta data matury minęła — ustaw nową.';
      case PlanPhase.examToday:
        title = 'Dziś matura';
        subtitle = 'Powodzenia!';
      case PlanPhase.learning:
      case PlanPhase.revision:
        title = '${daysLeftLabel(summary.daysLeft)} do matury';
        subtitle = plan.totalItems == 0 ? 'Na dziś nie ma nic do zrobienia.' : 'Dziś: ${planItemsLabel(plan)}';
    }
    final showProgress = plan.isActive && plan.totalItems > 0;

    return AppCard(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StudyPlanScreen())),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.green.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.event_note_rounded, color: AppColors.green),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('PLAN NAUKI',
                    style: TextStyle(color: AppColors.green, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                const SizedBox(height: 2),
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                if (showProgress) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: plan.doneItems / plan.totalItems,
                            minHeight: 6,
                            backgroundColor: AppColors.darkBorder,
                            color: AppColors.green,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text('${plan.doneItems}/${plan.totalItems}',
                          style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
        ],
      ),
    );
  }
}

class _UpcomingTestCard extends StatelessWidget {
  final PlannedTest test;

  const _UpcomingTestCard({required this.test});

  @override
  Widget build(BuildContext context) {
    final date = parseDateKey(test.dateKey)!;
    final days = daysBetween(context.read<AppState>().clock(), date);
    return AppCard(
      borderColor: AppColors.orange,
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SchoolTestScreen(initialTest: test))),
      child: Row(
        children: [
          const Icon(Icons.assignment_outlined, color: AppColors.orange),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SPRAWDZIAN ${daysUntilLabel(days).toUpperCase()}',
                    style: const TextStyle(color: AppColors.orange, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                const SizedBox(height: 2),
                Text(chapterNames(test.chapterIds), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text('Kl. ${test.classLevel} · ${formatDatePl(date)} · rozwiąż próbny sprawdzian',
                    style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
        ],
      ),
    );
  }
}

class _TopGapCard extends StatelessWidget {
  final List<TopicGap> gaps;

  const _TopGapCard({required this.gaps});

  @override
  Widget build(BuildContext context) {
    final top = gaps.first;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('TWOJA NAJWIĘKSZA LUKA',
              style: TextStyle(color: AppColors.orange, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
          const SizedBox(height: 4),
          Text(top.topic.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 2),
          Text('${gapReason(top)} — tu tracisz najwięcej punktów.',
              style: const TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.35)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => openGapPractice(context, gaps),
                icon: const Icon(Icons.bolt_rounded, size: 18),
                label: const Text('Ćwicz luki'),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.black),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const GapsScreen())),
                child: const Text('Wszystkie luki'),
              ),
            ],
          ),
        ],
      ),
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

class _WideAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool locked;

  const _WideAction({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.locked = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(12),
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.green, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text(subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
              ],
            ),
          ),
          if (locked) const Icon(Icons.lock_rounded, color: AppColors.orange, size: 16),
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
