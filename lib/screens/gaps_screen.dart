import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import '../theme.dart';
import '../utils/plurals.dart';
import '../widgets/app_card.dart';
import 'flashcards_screen.dart';
import 'quiz_screen.dart';
import 'theory_screen.dart';

/// Opis, dlaczego temat uznano za lukę — np. „43% poprawnych w testach".
String gapReason(TopicGap gap) {
  final parts = <String>[
    if (gap.weakInTests)
      '${gap.accuracy.round()}% poprawnych w testach (${gap.answered} ${plural(gap.answered, 'odpowiedź', 'odpowiedzi', 'odpowiedzi')})',
    if (gap.weakInFlashcards)
      '${gap.lapsedCards} ${plural(gap.lapsedCards, 'fiszka oznaczona', 'fiszki oznaczone', 'fiszek oznaczonych')} „Nie umiem”',
  ];
  return parts.join(' · ');
}

void openGapPractice(BuildContext context, List<TopicGap> gaps, {String title = 'Ćwiczenie luk'}) {
  final items = context.read<AppState>().gapPracticeItems(gaps);
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => QuizScreen(title: title, items: items)));
}

class GapsScreen extends StatelessWidget {
  const GapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final gaps = state.topicGaps();
    final lapsed = state.lapsedCardsFor(gaps);
    final practiceCount = state.gapPracticeItems(gaps).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Twoje luki')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Luka to temat, w którym po co najmniej $gapMinAnswered odpowiedziach masz mniej niż '
            '${gapAccuracyThreshold.round()}% poprawnych albo co najmniej $gapMinLapsedCards fiszki oznaczone „Nie umiem”. '
            'Na górze są tematy, w których tracisz najwięcej punktów.',
            style: const TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 16),
          if (gaps.isEmpty)
            const AppCard(
              child: Text(
                'Nie wykryłem luk. Rozwiązuj testy i powtarzaj fiszki — tu pojawią się tematy, które wymagają powtórki.',
                style: TextStyle(fontSize: 14, height: 1.4),
              ),
            )
          else ...[
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: practiceCount == 0 ? null : () => openGapPractice(context, gaps),
                    icon: const Icon(Icons.bolt_rounded),
                    label: Text('Ćwicz luki ($practiceCount)'),
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.black),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: lapsed.isEmpty
                        ? null
                        : () => Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => FlashcardsScreen(cards: lapsed, title: 'Fiszki z luk'),
                            )),
                    icon: const Icon(Icons.style_outlined),
                    label: Text('Fiszki (${lapsed.length})'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            for (final gap in gaps)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GapCard(gap: gap),
              ),
          ],
        ],
      ),
    );
  }
}

class GapCard extends StatelessWidget {
  final TopicGap gap;

  const GapCard({super.key, required this.gap});

  @override
  Widget build(BuildContext context) {
    final state = context.read<AppState>();
    final lapsed = state.lapsedCardsFor([gap]);
    final classLevel = gap.chapter.id.substring(1, 2);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(gap.topic.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 2),
          Text('Kl. $classLevel · ${gap.chapter.name}', style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
          const SizedBox(height: 6),
          Text(gapReason(gap), style: const TextStyle(color: AppColors.orange, fontSize: 13)),
          const SizedBox(height: 10),
          Wrap(
            children: [
              TextButton.icon(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => TheoryScreen(topic: gap.topic))),
                icon: const Icon(Icons.view_column_outlined, size: 18),
                label: const Text('Teoria'),
              ),
              if (gap.topic.questions.isNotEmpty)
                TextButton.icon(
                  onPressed: () => openGapPractice(context, [gap], title: gap.topic.name),
                  icon: const Icon(Icons.description_outlined, size: 18),
                  label: const Text('Test'),
                ),
              if (lapsed.isNotEmpty)
                TextButton.icon(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => FlashcardsScreen(cards: lapsed, title: gap.topic.name),
                  )),
                  icon: const Icon(Icons.style_outlined, size: 18),
                  label: const Text('Fiszki'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
