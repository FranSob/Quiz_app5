import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../data/data_tasks.dart';
import '../state/app_state.dart';
import '../task_models.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import 'data_task_screen.dart';

IconData iconForVisual(TaskVisual visual) {
  if (visual is TableVisual) return Icons.table_chart_outlined;
  if (visual is BarChartVisual) return Icons.bar_chart_rounded;
  if (visual is PedigreeVisual) return Icons.account_tree_outlined;
  if (visual is GelVisual) return Icons.view_week_outlined;
  return Icons.show_chart_rounded;
}

class DataTasksScreen extends StatefulWidget {
  const DataTasksScreen({super.key});

  @override
  State<DataTasksScreen> createState() => _DataTasksScreenState();
}

class _DataTasksScreenState extends State<DataTasksScreen> {
  late int _classLevel = context.read<AppState>().selectedClassLevel;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final tasks = dataTasks.where((t) => t.classLevel == _classLevel).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Zadania z danymi')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Na maturze większość zadań opiera się na wykresach, tabelach i schematach. '
            'Tu ćwiczysz odczytywanie danych i wyciąganie z nich wniosków.',
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
                  labelStyle: TextStyle(color: _classLevel == level ? Colors.black : null, fontWeight: FontWeight.bold),
                  onSelected: (_) => setState(() => _classLevel = level),
                ),
            ],
          ),
          const SizedBox(height: 16),
          if (tasks.isEmpty)
            const Text('Brak zadań dla tej klasy.', style: TextStyle(color: AppColors.textMuted)),
          for (final task in tasks)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AppCard(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DataTaskScreen(task: task))),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColors.green.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(iconForVisual(task.visual), color: AppColors.green),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(task.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(height: 2),
                          Text(findTopicById(task.topicId)?.name ?? '',
                              style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (state.dataTaskBest.containsKey(task.id))
                      Text('${state.dataTaskBest[task.id]} / ${task.questions.length}',
                          style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold))
                    else
                      const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
