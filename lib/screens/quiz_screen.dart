import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';

class QuizItem {
  final QuizQuestion question;
  final String topicId;
  QuizItem({required this.question, required this.topicId});
}

class QuizScreen extends StatefulWidget {
  final String chapterId;
  final String title;
  final List<QuizItem> items;

  const QuizScreen({super.key, required this.chapterId, required this.title, required this.items});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final List<QuizItem> _items;
  int _index = 0;
  int? _selected;
  bool _answered = false;
  int _correct = 0;

  @override
  void initState() {
    super.initState();
    _items = List.of(widget.items)..shuffle();
  }

  void _select(int optionIndex) {
    if (_answered) return;
    final item = _items[_index];
    final isCorrect = optionIndex == item.question.correctIndex;
    setState(() {
      _selected = optionIndex;
      _answered = true;
      if (isCorrect) _correct++;
    });
    context.read<AppState>().recordTestAnswer(
          topicId: item.topicId,
          chapterId: widget.chapterId,
          correct: isCorrect,
        );
  }

  void _next() {
    if (_index + 1 >= _items.length) {
      final perfect = _correct == _items.length;
      context.read<AppState>().completeTest(perfect: perfect);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => _QuizResultScreen(correct: _correct, total: _items.length),
      ));
      return;
    }
    setState(() {
      _index++;
      _selected = null;
      _answered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: Text('Brak pytań w tym zakresie.', style: TextStyle(color: AppColors.textMuted))),
      );
    }

    final item = _items[_index];
    final q = item.question;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_index) / _items.length,
              backgroundColor: AppColors.darkBorder,
              color: AppColors.green,
              minHeight: 6,
            ),
            const SizedBox(height: 8),
            Text('Pytanie ${_index + 1} / ${_items.length}', style: const TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 20),
            Text(q.question, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.3)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: q.options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, i) {
                  Color? bg;
                  Color border = AppColors.darkBorder;
                  if (_answered) {
                    if (i == q.correctIndex) {
                      bg = AppColors.green.withValues(alpha: 0.18);
                      border = AppColors.green;
                    } else if (i == _selected) {
                      bg = AppColors.red.withValues(alpha: 0.18);
                      border = AppColors.red;
                    }
                  }
                  return AppCard(
                    color: bg,
                    borderColor: border,
                    onTap: () => _select(i),
                    child: Text(q.options[i], style: const TextStyle(fontSize: 15)),
                  );
                },
              ),
            ),
            if (_answered) ...[
              const SizedBox(height: 12),
              AppCard(
                color: AppColors.darkCardAlt,
                child: Text(q.explanation, style: const TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.4)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _next,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 14)),
                child: Text(_index + 1 >= _items.length ? 'Zakończ test' : 'Dalej'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _QuizResultScreen extends StatelessWidget {
  final int correct;
  final int total;
  const _QuizResultScreen({required this.correct, required this.total});

  @override
  Widget build(BuildContext context) {
    final pct = total > 0 ? (correct / total * 100).round() : 0;
    return Scaffold(
      appBar: AppBar(title: const Text('Wynik testu')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                pct >= 80 ? Icons.emoji_events_rounded : Icons.check_circle_rounded,
                color: AppColors.green,
                size: 72,
              ),
              const SizedBox(height: 16),
              Text('$pct%', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.green)),
              const SizedBox(height: 8),
              Text('Poprawne odpowiedzi: $correct / $total', style: const TextStyle(color: AppColors.textMuted, fontSize: 15)),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.black),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text('Wróć do nauki'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
