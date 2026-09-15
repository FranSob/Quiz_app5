import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/mock_exam.dart';
import '../logic/premium.dart';
import '../logic/readiness.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/premium_lock.dart';

const String readinessDescription =
    'Pokazuje, jaką część materiału klas 1–4 masz już opanowaną — ogółem, w każdej klasie i w każdym dziale — '
    'oraz jak ten wynik zmienia się w czasie.';

/// „2026-09-15" → „15.09"
String shortDateKey(String key) => key.length == 10 ? '${key.substring(8)}.${key.substring(5, 7)}' : key;

class ReadinessScreen extends StatelessWidget {
  const ReadinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final locked = isFeatureLocked(PremiumFeature.readiness, isPremium: state.isPremium);

    return Scaffold(
      appBar: AppBar(title: const Text('Gotowość do matury')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: locked
            ? const [PremiumLockedCard(feature: PremiumFeature.readiness, description: readinessDescription)]
            : _content(state),
      ),
    );
  }

  List<Widget> _content(AppState state) {
    final report = state.readinessReport;
    final history = (state.readinessHistory.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
    final recent = history.length > 30 ? history.sublist(history.length - 30) : history;
    final lastExam = state.examHistory.isEmpty ? null : state.examHistory.last;

    return [
      AppCard(
        color: AppColors.greenBanner,
        borderColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${report.overall.round()}%',
                style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
            const Text('gotowości do matury', style: TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 8),
            Text('Tematy z odpowiedziami: ${report.topicsWithAnswers} z ${report.totalTopics}',
                style: const TextStyle(color: Colors.white, fontSize: 13)),
          ],
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        'Jak liczę: w każdym temacie biorę skuteczność Twoich odpowiedzi z testów, zadań z danymi, zadań otwartych '
        'i próbnych matur. Temat liczy się w pełni od $readinessFullAnswers odpowiedzi, a tematy bez odpowiedzi mają 0%. '
        'To szacunek opanowania materiału, a nie prognoza wyniku matury.',
        style: TextStyle(color: AppColors.textMuted, fontSize: 12.5, height: 1.45),
      ),
      if (lastExam != null) ...[
        const SizedBox(height: 16),
        AppCard(
          child: Row(
            children: [
              const Icon(Icons.timer_outlined, color: AppColors.green),
              const SizedBox(width: 12),
              Expanded(
                child: Text('Ostatnia ${specForId(lastExam.variant).title.toLowerCase()}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              Text('${lastExam.points}/${lastExam.maxPoints} pkt · ${lastExam.percent.round()}%',
                  style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
        ),
      ],
      const SizedBox(height: 16),
      AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Zmiana w czasie', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            if (recent.length < 2)
              const Text('Wykres pojawi się po co najmniej dwóch dniach nauki.',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 13))
            else ...[
              SizedBox(
                height: 150,
                child: LineChart(
                  LineChartData(
                    minY: 0,
                    maxY: 100,
                    minX: 0,
                    maxX: (recent.length - 1).toDouble(),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 34,
                          interval: 50,
                          getTitlesWidget: (value, meta) => Text('${value.round()}%',
                              style: const TextStyle(color: AppColors.textMuted, fontSize: 10)),
                        ),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          for (var i = 0; i < recent.length; i++) FlSpot(i.toDouble(), recent[i].value.toDouble()),
                        ],
                        color: AppColors.green,
                        barWidth: 3,
                        dotData: const FlDotData(show: true),
                        belowBarData: BarAreaData(show: true, color: AppColors.green.withValues(alpha: 0.12)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(shortDateKey(recent.first.key), style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                  Text(shortDateKey(recent.last.key), style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                ],
              ),
            ],
          ],
        ),
      ),
      const SizedBox(height: 16),
      AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Klasy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            for (final entry in report.byClass.entries) _PercentBar(label: 'Klasa ${entry.key}', percent: entry.value),
          ],
        ),
      ),
      for (final level in report.byClass.keys) ...[
        const SizedBox(height: 16),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Działy — klasa $level', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              for (final chapter in report.chapters.where((c) => c.classLevel == level))
                _PercentBar(label: chapter.chapter.name, percent: chapter.percent),
            ],
          ),
        ),
      ],
    ];
  }
}

class _PercentBar extends StatelessWidget {
  final String label;
  final double percent;

  const _PercentBar({required this.label, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(label, style: const TextStyle(fontSize: 13))),
              const SizedBox(width: 8),
              Text('${percent.round()}%',
                  style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (percent / 100).clamp(0, 1),
              minHeight: 6,
              backgroundColor: AppColors.darkBorder,
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
