import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';

/// Porównanie ceny rocznej z korepetycjami. Wyliczenia: rok szkolny to około
/// 36 tygodni, więc lekcja raz w tygodniu po 100–150 zł kosztuje 3600–5400 zł;
/// 149 zł : 365 dni ≈ 41 gr dziennie.
class _TutoringComparison extends StatelessWidget {
  const _TutoringComparison();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: AppColors.orange,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.orange.withValues(alpha: 0.18), borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.school_outlined, color: AppColors.orange),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('149 zł za cały rok = mniej niż jedna godzina korepetycji',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, height: 1.3)),
                SizedBox(height: 8),
                Text(
                  'Godzina korepetycji z biologii kosztuje zwykle 100–150 zł. Korepetycje raz w tygodniu przez rok szkolny '
                  'to około 3600–5400 zł. Premium w planie rocznym to około 41 gr dziennie.',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12.5, height: 1.45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool _yearly = true;

  // Tylko funkcje, które naprawdę są w aplikacji. Podział: lib/logic/premium.dart.
  static const _rows = [
    ['Teoria wszystkich działów', 'tak', 'tak'],
    ['Fiszki z powtórkami', 'bez limitu', 'bez limitu'],
    ['Testy, sprawdziany i ćwiczenie luk', 'bez limitu', 'bez limitu'],
    ['Plan nauki do matury', 'tak', 'tak'],
    ['Zadania z danymi i zadania otwarte', 'tak', 'tak'],
    ['Notatki do druku (PDF)', 'tak', 'tak'],
    ['Statystyki i wykryte luki', 'tak', 'tak'],
    ['Próbna matura z timerem', 'nie', 'tak'],
    ['Wskaźnik gotowości do matury', 'nie', 'tak'],
  ];

  Future<void> _unlock(AppState state) async {
    if (state.isPremium) {
      state.setPremium(false);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Premium wyłączone (podgląd projektu).')),
      );
      return;
    }
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkCard,
        title: const Text('Podgląd projektu'),
        content: const Text('To jest wersja demonstracyjna — brak realnych płatności. Odblokować funkcje Premium lokalnie?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Anuluj')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Odblokuj')),
        ],
      ),
    );
    if (confirmed == true) {
      state.setPremium(true);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Premium odblokowane!'), backgroundColor: AppColors.green),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.green, Color(0xFF1F8F5F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.25), borderRadius: BorderRadius.circular(14)),
                  child: const Icon(Icons.workspace_premium_rounded, color: Colors.white, size: 28),
                ),
                const SizedBox(height: 16),
                Text(
                  state.isPremium ? 'Masz pełne przygotowanie' : 'Odblokuj pełne przygotowanie',
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Cała nauka jest za darmo. Premium dodaje próbną maturę z timerem i wskaźnik gotowości do matury.',
                  style: TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const _TutoringComparison(),
                const SizedBox(height: 16),
                AppCard(
                  padding: EdgeInsets.zero,
                  child: Table(
                    columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(1.1), 2: FlexColumnWidth(1.3)},
                    children: [
                      TableRow(
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: AppColors.darkBorder)),
                        ),
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                            child: Text('FUNKCJA', style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text('Darmowy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text('Premium', style: TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                        ],
                      ),
                      for (final row in _rows)
                        TableRow(
                          decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(color: AppColors.darkBorder)),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                              child: Text(row[0], style: const TextStyle(fontSize: 12.5)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                row[1],
                                style: TextStyle(fontSize: 12.5, color: row[1] == 'nie' ? AppColors.red : AppColors.textMuted),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(row[2], style: const TextStyle(fontSize: 12.5, color: AppColors.green, fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => setState(() => _yearly = false),
                  child: AppCard(
                    borderColor: !_yearly ? AppColors.orange : AppColors.darkBorder,
                    child: Row(
                      children: [
                        Icon(!_yearly ? Icons.radio_button_checked : Icons.radio_button_off, color: AppColors.orange),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Miesięczny', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('odnawiany co miesiąc', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                            ],
                          ),
                        ),
                        const Text('19,99 zł', style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => setState(() => _yearly = true),
                  child: AppCard(
                    borderColor: _yearly ? AppColors.orange : AppColors.darkBorder,
                    child: Row(
                      children: [
                        Icon(_yearly ? Icons.radio_button_checked : Icons.radio_button_off, color: AppColors.orange),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('Roczny', style: TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(color: AppColors.orange, borderRadius: BorderRadius.circular(6)),
                                    child: const Text('-38%', style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              const Text('12,42 zł / miesiąc · mniej niż 1 h korepetycji',
                                  style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                            ],
                          ),
                        ),
                        const Text('149 zł', style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _unlock(state),
                    icon: Icon(state.isPremium ? Icons.check_circle_rounded : Icons.workspace_premium_rounded),
                    label: Text(state.isPremium ? 'Premium aktywne (wyłącz)' : 'Odblokuj Premium'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Podgląd projektu — brak realnych płatności.',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
