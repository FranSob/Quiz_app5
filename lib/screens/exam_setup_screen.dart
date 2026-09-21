import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/mock_exam.dart';
import '../logic/premium.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../utils/dates.dart';
import '../widgets/app_card.dart';
import '../widgets/cke_link_card.dart';
import '../widgets/premium_lock.dart';
import 'exam_screen.dart';

const String mockExamDescription =
    'Rozwiąż cały arkusz na czas: pytania zamknięte, zadania z danymi i zadania otwarte z materiału klas 1–4. '
    'Po zakończeniu zobaczysz wynik w punktach i omówienie błędów.';

class ExamSetupScreen extends StatelessWidget {
  const ExamSetupScreen({super.key});

  void _start(BuildContext context, ExamVariant variant) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => ExamScreen(variant: variant, items: buildExam(variant, Random())),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final locked = isFeatureLocked(PremiumFeature.mockExam, isPremium: state.isPremium);
    final history = state.examHistory.reversed.take(10).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Próbna matura')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (locked)
            const PremiumLockedCard(feature: PremiumFeature.mockExam, description: mockExamDescription)
          else ...[
            const Text(mockExamDescription, style: TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.4)),
            const SizedBox(height: 16),
            for (final variant in ExamVariant.values)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _VariantCard(spec: examSpecs[variant]!, onStart: () => _start(context, variant)),
              ),
          ],
          const SizedBox(height: 6),
          const AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Zasady', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(height: 8),
                Text(
                  '• Zadania są losowane z materiału klas 1–4 i przygotowane w aplikacji w stylu maturalnym — to nie są arkusze CKE.\n'
                  '• W trakcie nie widzisz poprawnych odpowiedzi. Możesz wracać do zadań i zmieniać odpowiedzi.\n'
                  '• Gdy skończy się czas, arkusz zamyka się automatycznie.\n'
                  '• Zadania otwarte oceniasz sam według klucza, a potem widzisz wynik i omówienie błędów.',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const CkeLinkCard(),
          if (history.isNotEmpty) ...[
            const SizedBox(height: 20),
            const Text('TWOJE WYNIKI',
                style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 13)),
            const SizedBox(height: 10),
            for (final record in history)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: AppCard(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(specForId(record.variant).title,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            Text(
                              '${_formatKey(record.dateKey)} · czas ${formatClock(record.seconds)}',
                              style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text('${record.points}/${record.maxPoints} pkt · ${record.percent.round()}%',
                          style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  static String _formatKey(String key) {
    final date = parseDateKey(key);
    return date == null ? key : formatDatePl(date);
  }
}

class _VariantCard extends StatelessWidget {
  final ExamSpec spec;
  final VoidCallback onStart;

  const _VariantCard({required this.spec, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(spec.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
              const Icon(Icons.timer_outlined, color: AppColors.green, size: 18),
              const SizedBox(width: 4),
              Text('${spec.minutes} min', style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Pytania zamknięte: ${spec.closed} · Zadania z danymi: ${spec.dataTasks} · Zadania otwarte: ${spec.open}',
            style: const TextStyle(color: AppColors.textMuted, fontSize: 12.5, height: 1.4),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onStart,
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.black),
            child: Text('Rozpocznij: ${spec.title}'),
          ),
        ],
      ),
    );
  }
}
