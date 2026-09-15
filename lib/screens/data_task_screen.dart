import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../state/app_state.dart';
import '../task_models.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/data_visual.dart';

class DataTaskScreen extends StatefulWidget {
  final DataTask task;

  const DataTaskScreen({super.key, required this.task});

  @override
  State<DataTaskScreen> createState() => _DataTaskScreenState();
}

class _DataTaskScreenState extends State<DataTaskScreen> {
  final Map<int, int> _answers = {};
  bool _finished = false;

  int get _correct => _answers.entries.where((e) => widget.task.questions[e.key].correctIndex == e.value).length;

  bool get _allAnswered => _answers.length == widget.task.questions.length;

  void _answer(int questionIndex, int optionIndex) {
    if (_answers.containsKey(questionIndex)) return;
    final question = widget.task.questions[questionIndex];
    setState(() => _answers[questionIndex] = optionIndex);
    context.read<AppState>().recordTestAnswer(
          topicId: widget.task.topicId,
          chapterId: chapterOfTopic(widget.task.topicId)?.id ?? widget.task.topicId,
          questionId: question.id,
          correct: optionIndex == question.correctIndex,
        );
  }

  void _finish() {
    if (!_finished) {
      _finished = true;
      context.read<AppState>().completeDataTask(widget.task.id, _correct);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(task.intro, style: const TextStyle(fontSize: 14, height: 1.5)),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.caption, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 14),
                TaskVisualView(visual: task.visual),
              ],
            ),
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < task.questions.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _QuestionCard(
                number: i + 1,
                question: task.questions[i],
                selected: _answers[i],
                onSelect: (option) => _answer(i, option),
              ),
            ),
          if (_allAnswered) ...[
            AppCard(
              color: AppColors.greenBanner,
              borderColor: Colors.transparent,
              child: Text(
                'Wynik: $_correct / ${task.questions.length} poprawnych odpowiedzi',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _finish,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Zakończ zadanie'),
            ),
          ],
        ],
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final int number;
  final DataTaskQuestion question;
  final int? selected;
  final ValueChanged<int> onSelect;

  const _QuestionCard({required this.number, required this.question, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final answered = selected != null;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pytanie $number', style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 6),
          Text(question.prompt, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.35)),
          const SizedBox(height: 12),
          for (var i = 0; i < question.options.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AppCard(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                color: answered && i == question.correctIndex
                    ? AppColors.green.withValues(alpha: 0.18)
                    : answered && i == selected
                        ? AppColors.red.withValues(alpha: 0.18)
                        : (isDark ? AppColors.darkCardAlt : AppColors.lightBg),
                borderColor: answered && i == question.correctIndex
                    ? AppColors.green
                    : answered && i == selected
                        ? AppColors.red
                        : Colors.transparent,
                onTap: answered ? null : () => onSelect(i),
                child: Text(question.options[i], style: const TextStyle(fontSize: 14)),
              ),
            ),
          if (answered) ...[
            const SizedBox(height: 4),
            Text(
              selected == question.correctIndex ? 'Dobrze! ${question.explanation}' : 'Źle. ${question.explanation}',
              style: TextStyle(
                color: selected == question.correctIndex ? AppColors.green : AppColors.orange,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
