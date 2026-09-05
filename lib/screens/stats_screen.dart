import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import 'premium_screen.dart';
import 'quiz_screen.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final weakest = state.weakestChapters();
    final weekly = state.last7DaysAccuracy();

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        const Text('Statystyki', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.7,
          children: [
            _StatTile(value: '${state.masteredMaterialPercent.round()}%', label: 'Opanowany materiał'),
            _StatTile(value: '${state.totalQuestionsAnswered}', label: 'Rozwiązane pytania'),
            _StatTile(value: '${state.overallAccuracy.round()}%', label: 'Średnia skuteczność'),
            _StatTile(value: '${state.dueFlashcardsCount()}', label: 'Fiszki do powtórki'),
          ],
        ),
        const SizedBox(height: 16),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Skuteczność w działach', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              if (weakest.isEmpty)
                const Text('Rozwiąż pierwszy test, żeby zobaczyć podział na działy.',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 13))
              else
                ...weakest.map((c) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text(c.name, style: const TextStyle(fontSize: 13))),
                              Text('${state.chapterAccuracy(c.id).round()}%',
                                  style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 13)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: state.chapterAccuracy(c.id) / 100,
                              minHeight: 6,
                              backgroundColor: AppColors.darkBorder,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    )),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Skuteczność w czasie (7 dni)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 16),
              SizedBox(
                height: 140,
                child: LineChart(
                  LineChartData(
                    minY: 0,
                    maxY: 100,
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final i = value.toInt();
                            if (i < 0 || i >= weekly.length) return const SizedBox();
                            return Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(weekly[i].key, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                            );
                          },
                        ),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: List.generate(weekly.length, (i) => FlSpot(i.toDouble(), weekly[i].value)),
                        isCurved: true,
                        color: AppColors.green,
                        barWidth: 3,
                        dotData: const FlDotData(show: true),
                        belowBarData: BarAreaData(show: true, color: AppColors.green.withValues(alpha: 0.12)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Najsłabsze działy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              if (weakest.isEmpty)
                const Text('Brak danych — rozwiąż kilka testów.', style: TextStyle(color: AppColors.textMuted, fontSize: 13))
              else
                ...weakest.map((c) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(c.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                Text('${state.chapterAccuracy(c.id).round()}% skuteczności',
                                    style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: c.allQuestions.isEmpty
                                ? null
                                : () => Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => QuizScreen(
                                        chapterId: c.id,
                                        title: 'Test — ${c.name}',
                                        items: c.topics
                                            .expand((t) => t.questions.map((q) => QuizItem(question: q, topicId: t.id)))
                                            .toList(),
                                      ),
                                    )),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greenDark,
                              foregroundColor: AppColors.green,
                              elevation: 0,
                            ),
                            child: const Text('Ćwicz teraz'),
                          ),
                        ],
                      ),
                    )),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _LockedAchievements(isPremium: state.isPremium),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final String value;
  final String label;
  const _StatTile({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: const TextStyle(color: AppColors.green, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
        ],
      ),
    );
  }
}

class _LockedAchievements extends StatelessWidget {
  final bool isPremium;
  const _LockedAchievements({required this.isPremium});

  @override
  Widget build(BuildContext context) {
    final content = AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Najnowsze osiągnięcia', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 6),
          Text('Program nauki, historia sesji, szczegółowa analiza.', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _FakeChip(),
              _FakeChip(),
              _FakeChip(),
            ],
          ),
        ],
      ),
    );

    if (isPremium) return content;

    return Stack(
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: content,
        ),
        Positioned.fill(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: AppColors.orange, shape: BoxShape.circle),
                  child: const Icon(Icons.lock_rounded, color: Colors.black),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PremiumScreen())),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
                  child: const Text('Odblokuj w Premium'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FakeChip extends StatelessWidget {
  const _FakeChip();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 28,
      decoration: BoxDecoration(color: AppColors.green.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(8)),
    );
  }
}
