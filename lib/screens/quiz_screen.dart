import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../logic/school_test.dart';
import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import 'theory_screen.dart';

/// Pytanie z wylosowaną kolejnością odpowiedzi.
///
/// W bazie pytań poprawna odpowiedź stoi najczęściej na tej samej pozycji,
/// więc bez losowania uczeń mógłby zdawać testy, zawsze wybierając drugą
/// odpowiedź. Kolejność losujemy raz, przy wejściu w test, żeby nie zmieniała
/// się przy każdym przebudowaniu widoku.
class _ShuffledQuestion {
  final QuizQuestion question;
  final String topicId;
  final List<String> options;
  final int correctIndex;

  _ShuffledQuestion({
    required this.question,
    required this.topicId,
    required this.options,
    required this.correctIndex,
  });

  factory _ShuffledQuestion.from(QuizItem item) {
    final q = item.question;
    final order = List<int>.generate(q.options.length, (i) => i)..shuffle();
    return _ShuffledQuestion(
      question: q,
      topicId: item.topicId,
      options: [for (final i in order) q.options[i]],
      correctIndex: order.indexOf(q.correctIndex),
    );
  }
}

class _TopicScore {
  int answered = 0;
  int correct = 0;
}

class QuizScreen extends StatefulWidget {
  /// Dział, do którego wliczają się odpowiedzi. Gdy null, dział ustala się
  /// osobno dla każdego pytania — w testach obejmujących kilka działów.
  final String? chapterId;
  final String title;
  final List<QuizItem> items;

  /// Pokazuje na wyniku orientacyjną ocenę szkolną (tryb sprawdzianu).
  final bool showSchoolGrade;

  const QuizScreen({
    super.key,
    this.chapterId,
    required this.title,
    required this.items,
    this.showSchoolGrade = false,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final List<_ShuffledQuestion> _items;
  final Map<String, _TopicScore> _scores = {};
  int _index = 0;
  int? _selected;
  bool _answered = false;
  int _correct = 0;

  @override
  void initState() {
    super.initState();
    _items = widget.items.map(_ShuffledQuestion.from).toList()..shuffle();
  }

  void _select(int optionIndex) {
    if (_answered) return;
    final item = _items[_index];
    final isCorrect = optionIndex == item.correctIndex;
    setState(() {
      _selected = optionIndex;
      _answered = true;
      if (isCorrect) _correct++;
      final score = _scores.putIfAbsent(item.topicId, () => _TopicScore());
      score.answered++;
      if (isCorrect) score.correct++;
    });
    context.read<AppState>().recordTestAnswer(
          topicId: item.topicId,
          chapterId: widget.chapterId ?? chapterOfTopic(item.topicId)?.id ?? item.topicId,
          questionId: item.question.id,
          correct: isCorrect,
        );
  }

  void _next() {
    if (_index + 1 >= _items.length) {
      final perfect = _correct == _items.length;
      context.read<AppState>().completeTest(perfect: perfect);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => _QuizResultScreen(
          correct: _correct,
          total: _items.length,
          scores: _scores,
          showSchoolGrade: widget.showSchoolGrade,
        ),
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
                itemCount: item.options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, i) {
                  Color? bg;
                  Color border = AppColors.darkBorder;
                  if (_answered) {
                    if (i == item.correctIndex) {
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
                    child: Text(item.options[i], style: const TextStyle(fontSize: 15)),
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
  final Map<String, _TopicScore> scores;
  final bool showSchoolGrade;

  const _QuizResultScreen({
    required this.correct,
    required this.total,
    required this.scores,
    required this.showSchoolGrade,
  });

  @override
  Widget build(BuildContext context) {
    final pct = total > 0 ? (correct / total * 100).round() : 0;
    final grade = gradeFor(correct, total);
    final topicRows = [
      for (final entry in scores.entries)
        if (findTopicById(entry.key) != null) MapEntry(findTopicById(entry.key)!, entry.value),
    ]..sort((a, b) => (a.value.correct / a.value.answered).compareTo(b.value.correct / b.value.answered));

    return Scaffold(
      appBar: AppBar(title: Text(showSchoolGrade ? 'Wynik sprawdzianu' : 'Wynik testu')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Icon(
            pct >= 80 ? Icons.emoji_events_rounded : Icons.check_circle_rounded,
            color: AppColors.green,
            size: 72,
          ),
          const SizedBox(height: 16),
          Text('$pct%',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.green)),
          const SizedBox(height: 8),
          Text('Poprawne odpowiedzi: $correct / $total',
              textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textMuted, fontSize: 15)),
          if (showSchoolGrade) ...[
            const SizedBox(height: 20),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Orientacyjna ocena: ${grade.value} (${grade.name})',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 6),
                  const Text(
                    'Według typowej skali: 100% — 6, od 90% — 5, od 75% — 4, od 55% — 3, od 40% — 2. '
                    'W Twojej szkole progi mogą być inne.',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 12.5, height: 1.4),
                  ),
                ],
              ),
            ),
          ],
          if (topicRows.isNotEmpty) ...[
            const SizedBox(height: 20),
            const Text('WYNIK W TEMATACH',
                style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 13)),
            const SizedBox(height: 10),
            for (final row in topicRows)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _TopicResultRow(topic: row.key, score: row.value),
              ),
          ],
          const SizedBox(height: 12),
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
    );
  }
}

class _TopicResultRow extends StatelessWidget {
  final Topic topic;
  final _TopicScore score;

  const _TopicResultRow({required this.topic, required this.score});

  @override
  Widget build(BuildContext context) {
    final percent = score.correct / score.answered * 100;
    final needsReview = percent < gapAccuracyThreshold;
    return AppCard(
      padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
      child: Row(
        children: [
          Icon(
            needsReview ? Icons.error_outline_rounded : Icons.check_circle_outline_rounded,
            color: needsReview ? AppColors.orange : AppColors.green,
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(topic.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text(
                  '${score.correct} / ${score.answered} poprawnych${needsReview ? ' · do powtórki' : ''}',
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
              ],
            ),
          ),
          if (needsReview)
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => TheoryScreen(topic: topic))),
              child: const Text('Teoria'),
            ),
        ],
      ),
    );
  }
}
