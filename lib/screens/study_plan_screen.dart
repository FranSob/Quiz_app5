import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../logic/study_plan.dart';
import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../utils/dates.dart';
import '../utils/plurals.dart';
import '../widgets/app_card.dart';
import 'data_task_screen.dart';
import 'flashcards_screen.dart';
import 'open_question_screen.dart';
import 'quiz_screen.dart';
import 'theory_screen.dart';

/// „Został 1 dzień", „Zostały 3 dni", „Zostało 147 dni"
String daysLeftLabel(int n) => '${plural(n, 'Został', 'Zostały', 'Zostało')} $n ${plural(n, 'dzień', 'dni', 'dni')}';

String cardsLabel(int n) => '$n ${plural(n, 'fiszka', 'fiszki', 'fiszek')}';

/// Krótki opis planu na dziś, np. „2 tematy · 30 fiszek · 1 test".
String planItemsLabel(DailyPlan plan) => [
      if (plan.topics.isNotEmpty) topicsLabel(plan.topics.length),
      if (plan.cardsTarget > 0) cardsLabel(plan.cardsTarget),
      if (plan.testTopic != null) '1 test',
      if (plan.dataTask != null) '1 zadanie z danymi',
      if (plan.openQuestion != null) '1 zadanie otwarte',
    ].join(' · ');

Future<void> pickExamDate(BuildContext context) async {
  final state = context.read<AppState>();
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final lastDate = DateTime(today.year + 5, today.month, today.day);
  var initial = state.examDate ?? DateTime(today.year, today.month + 6, today.day);
  if (initial.isBefore(today)) initial = today;
  if (initial.isAfter(lastDate)) initial = lastDate;
  final picked = await showDatePicker(
    context: context,
    initialDate: initial,
    firstDate: today,
    lastDate: lastDate,
    helpText: 'Data matury z biologii',
  );
  if (picked != null) state.setExamDate(picked);
}

void openPlanTest(BuildContext context, DailyPlan plan) {
  final topic = plan.testTopic;
  if (topic == null) return;
  final state = context.read<AppState>();
  final gap = state.topicGaps().where((g) => g.topic.id == topic.id).toList();
  final items = gap.isNotEmpty
      ? state.gapPracticeItems(gap)
      : [for (final q in topic.questions) QuizItem(question: q, topicId: topic.id)];
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => QuizScreen(title: topic.name, items: items)));
}

class StudyPlanScreen extends StatelessWidget {
  const StudyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final plan = state.todayPlan();
    final exam = state.examDate;
    final totalTopics = allChapters.fold<int>(0, (s, c) => s + c.topics.length);

    return Scaffold(
      appBar: AppBar(title: const Text('Plan nauki do matury')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppCard(
            child: Row(
              children: [
                const Icon(Icons.event_rounded, color: AppColors.green),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    exam == null ? 'Nie ustawiono daty matury' : 'Matura: ${formatDatePl(exam)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                TextButton(
                  onPressed: () => pickExamDate(context),
                  child: Text(exam == null ? 'Ustaw datę' : 'Zmień'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ..._statusSection(context, plan, totalTopics),
          if (plan.isActive) ...[
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  child: Text('DZIŚ',
                      style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 13)),
                ),
                Text('${plan.doneItems} / ${plan.totalItems} zrobione',
                    style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 10),
            if (plan.totalItems == 0)
              const AppCard(child: Text('Na dziś nie ma nic do zrobienia.', style: TextStyle(fontSize: 14))),
            for (final topic in plan.topics)
              _PlanItem(
                done: plan.isTopicDone(topic),
                title: topic.name,
                subtitle: 'Nowy temat · ${chapterOfTopic(topic.id)?.name ?? ''} · przeczytaj teorię i rozwiąż test',
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => TheoryScreen(topic: topic))),
              ),
            if (plan.cardsTarget > 0)
              _PlanItem(
                done: plan.cardsDone,
                title: 'Powtórz ${cardsLabel(plan.cardsTarget)}',
                subtitle: 'Dziś powtórzone: ${plan.cardsReviewedToday}',
                onTap: () {
                  final cards = state.dueFlashcards();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => FlashcardsScreen(
                      cards: cards.length > plan.cardsTarget ? cards.sublist(0, plan.cardsTarget) : cards,
                      title: 'Fiszki z planu',
                    ),
                  ));
                },
              ),
            if (plan.testTopic != null)
              _PlanItem(
                done: plan.testDoneToday,
                title: 'Test: ${plan.testTopic!.name}',
                subtitle: plan.testFromGaps ? 'Temat z największą luką — najpierw pytania z błędami' : 'Sprawdź, co zapamiętałeś',
                onTap: () => openPlanTest(context, plan),
              ),
            if (plan.dataTask != null)
              _PlanItem(
                done: plan.dataTaskDoneToday,
                title: 'Zadanie z danymi: ${plan.dataTask!.title}',
                subtitle: 'Wykres, tabela lub schemat — jak na maturze',
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => DataTaskScreen(task: plan.dataTask!),
                )),
              ),
            if (plan.openQuestion != null)
              _PlanItem(
                done: plan.openDoneToday,
                title: 'Zadanie otwarte: ${findTopicById(plan.openQuestion!.topicId)?.name ?? ''}',
                subtitle: 'Napisz odpowiedź i oceń ją według klucza',
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => OpenQuestionScreen(question: plan.openQuestion!),
                )),
              ),
          ],
          const SizedBox(height: 20),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Jak liczę plan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 8),
                Text(
                  '• Materiał z klas 1–4 rozkładam równo na dni, które zostały do matury, w kolejności programu.\n'
                  '• Temat uznaję za przerobiony, gdy przeczytasz teorię i masz co najmniej ${topicDoneAccuracy.round()}% poprawnych odpowiedzi w teście z tematu.\n'
                  '• Ostatnie tygodnie przed maturą (3 tygodnie, a przy krótszym czasie ostatni tydzień) są przeznaczone na powtórki.\n'
                  '• Nie planuję więcej niż $maxTopicsPerDay nowych tematów dziennie.\n'
                  '• Zadania na dziś ustalam raz dziennie — lista nie zmienia się, gdy odhaczasz kolejne punkty.',
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _statusSection(BuildContext context, DailyPlan plan, int totalTopics) {
    final summary = plan.summary;
    switch (summary.phase) {
      case PlanPhase.noExamDate:
        return [
          const AppCard(
            child: Text(
              'Ustaw datę matury, a rozpiszę cały materiał na dni: codziennie dostaniesz listę tematów, fiszek, test, zadanie z danymi i zadanie otwarte.',
              style: TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
        ];
      case PlanPhase.examPassed:
        return [
          const AppCard(
            child: Text('Ta data matury już minęła. Ustaw nową datę, żeby ułożyć plan.', style: TextStyle(fontSize: 14)),
          ),
        ];
      case PlanPhase.examToday:
        return [
          const AppCard(
            child: Text('Dziś matura — powodzenia! Nie ucz się już nowego materiału.', style: TextStyle(fontSize: 14)),
          ),
        ];
      case PlanPhase.learning:
      case PlanPhase.revision:
        final now = context.read<AppState>().clock();
        final revisionStart = DateTime(now.year, now.month, now.day + summary.learningDays);
        final done = totalTopics - summary.remainingTopics;
        return [
          AppCard(
            color: AppColors.greenBanner,
            borderColor: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${daysLeftLabel(summary.daysLeft)} do matury',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                Text('Przerobione tematy: $done z $totalTopics',
                    style: const TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: totalTopics == 0 ? 0 : done / totalTopics,
                    minHeight: 6,
                    backgroundColor: Colors.white24,
                    color: AppColors.green,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  summary.phase == PlanPhase.learning
                      ? 'Nowy materiał: ${topicsLabel(summary.topicsPerDay)} dziennie do ${formatDatePl(revisionStart)}, potem powtórki.'
                      : 'Czas powtórek: fiszki, testy z luk, zadania z danymi i zadania otwarte.',
                  style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),
          if (summary.behindSchedule) ...[
            const SizedBox(height: 10),
            AppCard(
              borderColor: AppColors.orange,
              child: Text(
                'Przy $maxTopicsPerDay tematach dziennie nie zdążysz przerobić całego materiału przed okresem powtórek '
                '(zostało ${topicsLabel(summary.remainingTopics)}). Ucz się systematycznie i zaczynaj od tematów z największymi lukami.',
                style: const TextStyle(fontSize: 13, height: 1.4),
              ),
            ),
          ],
        ];
    }
  }
}

class _PlanItem extends StatelessWidget {
  final bool done;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _PlanItem({required this.done, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              done ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
              color: done ? AppColors.green : AppColors.textMuted,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      decoration: done ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}
