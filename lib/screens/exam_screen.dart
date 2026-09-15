import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../logic/mock_exam.dart';
import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../utils/dates.dart';
import '../widgets/app_card.dart';
import '../widgets/data_visual.dart';
import '../widgets/open_answer_review.dart';
import 'open_question_screen.dart';

enum _Stage { exam, review, result }

/// Arkusz próbnej matury: rozwiązywanie na czas, samoocena zadań otwartych, wynik.
class ExamScreen extends StatefulWidget {
  final ExamVariant variant;
  final List<ExamItem> items;

  /// Źródło czasu — w testach można podmienić.
  final DateTime Function()? now;

  const ExamScreen({super.key, required this.variant, required this.items, this.now});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  late final DateTime Function() _now = widget.now ?? DateTime.now;
  late final DateTime _startedAt;
  late final int _limitSeconds = examSpecs[widget.variant]!.minutes * 60;

  _Stage _stage = _Stage.exam;
  int _index = 0;
  int _usedSeconds = 0;
  bool _timeUp = false;
  bool _saved = false;
  bool _leaving = false;

  final Map<int, int> _closed = {};
  final Map<int, Map<int, int>> _data = {};
  final Map<int, TextEditingController> _texts = {};
  final Map<int, Set<int>> _checked = {};

  List<ExamItem> get _items => widget.items;

  int get _elapsed => _now().difference(_startedAt).inSeconds;

  int get _remaining => (_limitSeconds - _elapsed).clamp(0, _limitSeconds);

  @override
  void initState() {
    super.initState();
    _startedAt = _now();
  }

  @override
  void dispose() {
    for (final controller in _texts.values) {
      controller.dispose();
    }
    super.dispose();
  }

  TextEditingController _textFor(int index) => _texts.putIfAbsent(index, TextEditingController.new);

  String _openText(int index) => _texts[index]?.text.trim() ?? '';

  bool _isAnswered(int index) {
    final item = _items[index];
    if (item is ClosedExamItem) return _closed.containsKey(index);
    if (item is DataExamItem) return (_data[index]?.length ?? 0) == item.task.questions.length;
    return _openText(index).isNotEmpty;
  }

  int get _answeredCount => [for (var i = 0; i < _items.length; i++) if (_isAnswered(i)) i].length;

  int _pointsFor(int index) {
    final item = _items[index];
    if (item is ClosedExamItem) return _closed[index] == item.correctIndex ? 1 : 0;
    if (item is DataExamItem) {
      final answers = _data[index] ?? const <int, int>{};
      var points = 0;
      for (var q = 0; q < item.task.questions.length; q++) {
        if (answers[q] == item.task.questions[q].correctIndex) points++;
      }
      return points;
    }
    if (!_isAnswered(index)) return 0;
    return openPoints((item as OpenExamItem).question, _checked[index] ?? const <int>{});
  }

  int get _totalPoints => [for (var i = 0; i < _items.length; i++) _pointsFor(i)].fold(0, (a, b) => a + b);

  // ---- przebieg arkusza ----

  void _onTimeUp() {
    if (_stage != _Stage.exam) return;
    _timeUp = true;
    _endExam();
  }

  Future<void> _confirmFinish() async {
    final missing = _items.length - _answeredCount;
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Zakończyć arkusz?'),
        content: Text(missing == 0
            ? 'Wszystkie zadania mają odpowiedź. Po zakończeniu nie można już zmieniać odpowiedzi.'
            : 'Zadania bez pełnej odpowiedzi: $missing. Po zakończeniu nie można już zmieniać odpowiedzi.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Wróć do arkusza')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Zakończ')),
        ],
      ),
    );
    if (ok == true && mounted && _stage == _Stage.exam) _endExam();
  }

  void _endExam() {
    FocusManager.instance.primaryFocus?.unfocus();
    final hasOpen = _items.any((item) => item is OpenExamItem && _isAnswered(_items.indexOf(item)));
    setState(() {
      _usedSeconds = _elapsed.clamp(0, _limitSeconds);
      _stage = hasOpen ? _Stage.review : _Stage.result;
    });
    if (_stage == _Stage.result) _saveResult();
  }

  void _showResult() {
    setState(() => _stage = _Stage.result);
    _saveResult();
  }

  /// Zapisuje wynik oraz odpowiedzi do statystyk tematów (luki, gotowość).
  void _saveResult() {
    if (_saved) return;
    _saved = true;
    final state = context.read<AppState>();
    for (var i = 0; i < _items.length; i++) {
      final item = _items[i];
      final chapterId = chapterOfTopic(item.topicId)?.id ?? item.topicId;
      if (item is ClosedExamItem) {
        final selected = _closed[i];
        if (selected == null) continue;
        state.recordTestAnswer(
          topicId: item.topicId,
          chapterId: chapterId,
          questionId: item.question.id,
          correct: selected == item.correctIndex,
        );
      } else if (item is DataExamItem) {
        final answers = _data[i] ?? const <int, int>{};
        for (final entry in answers.entries) {
          final question = item.task.questions[entry.key];
          state.recordTestAnswer(
            topicId: item.topicId,
            chapterId: chapterId,
            questionId: question.id,
            correct: entry.value == question.correctIndex,
          );
        }
      } else if (item is OpenExamItem && _isAnswered(i)) {
        state.recordOpenAnswer(
          topicId: item.topicId,
          questionId: item.question.id,
          points: _pointsFor(i),
          maxPoints: item.maxPoints,
        );
      }
    }
    state.completeExam(ExamRecord(
      dateKey: dateKey(state.clock()),
      variant: examSpecs[widget.variant]!.id,
      points: _totalPoints,
      maxPoints: examMaxPoints(_items),
      seconds: _usedSeconds,
    ));
  }

  Future<void> _confirmLeave() async {
    final leave = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Przerwać próbną maturę?'),
        content: const Text('Wynik nie zostanie zapisany.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Wróć do arkusza')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Przerwij')),
        ],
      ),
    );
    if (leave == true && mounted) {
      setState(() => _leaving = true);
      Navigator.of(context).pop();
    }
  }

  Future<void> _openIndex() async {
    final picked = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Spis zadań'),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var i = 0; i < _items.length; i++)
                  InkWell(
                    onTap: () => Navigator.of(context).pop(i),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _isAnswered(i) ? AppColors.green.withValues(alpha: 0.25) : Colors.transparent,
                        border: Border.all(
                          color: i == _index ? AppColors.orange : AppColors.darkBorder,
                          width: i == _index ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('${i + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                  ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(-1), child: const Text('Zakończ arkusz')),
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Zamknij')),
        ],
      ),
    );
    if (!mounted || picked == null || _stage != _Stage.exam) return;
    if (picked == -1) {
      await _confirmFinish();
    } else {
      setState(() => _index = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _stage == _Stage.result || _leaving,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _confirmLeave();
      },
      child: switch (_stage) {
        _Stage.exam => _buildExam(context),
        _Stage.review => _buildReview(context),
        _Stage.result => _buildResult(context),
      },
    );
  }

  // ---- arkusz ----

  Widget _buildExam(BuildContext context) {
    final item = _items[_index];
    final isLast = _index == _items.length - 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Zadanie ${_index + 1} z ${_items.length}'),
        actions: [
          _ExamClock(remainingSeconds: () => _remaining, onTimeUp: _onTimeUp),
          IconButton(tooltip: 'Spis zadań', icon: const Icon(Icons.grid_view_rounded), onPressed: _openIndex),
        ],
      ),
      body: ListView(
        key: ValueKey(_index),
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            '${_kindLabel(item).toUpperCase()} · ${item.maxPoints} PKT',
            style: const TextStyle(color: AppColors.green, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
          const SizedBox(height: 8),
          ..._itemBody(item, _index),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Odpowiedzi: $_answeredCount / ${_items.length}',
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _index > 0 ? () => setState(() => _index--) : null,
                      child: const Text('Poprzednie'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: isLast
                        ? ElevatedButton(
                            onPressed: _confirmFinish,
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.orange, foregroundColor: Colors.black),
                            child: const Text('Zakończ'),
                          )
                        : ElevatedButton(
                            onPressed: () => setState(() => _index++),
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.black),
                            child: const Text('Następne'),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _kindLabel(ExamItem item) {
    if (item is ClosedExamItem) return 'Zadanie zamknięte';
    if (item is DataExamItem) return 'Zadanie z danymi';
    return 'Zadanie otwarte';
  }

  List<Widget> _itemBody(ExamItem item, int index) {
    if (item is ClosedExamItem) {
      return [
        Text(item.question.question, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.4)),
        const SizedBox(height: 14),
        for (var o = 0; o < item.options.length; o++)
          _OptionTile(
            text: item.options[o],
            selected: _closed[index] == o,
            onTap: () => setState(() => _closed[index] = o),
          ),
      ];
    }
    if (item is DataExamItem) {
      final task = item.task;
      final answers = _data[index] ?? const <int, int>{};
      return [
        Text(task.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(task.intro, style: const TextStyle(fontSize: 14, height: 1.5)),
        const SizedBox(height: 12),
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
        for (var q = 0; q < task.questions.length; q++) ...[
          Text('${index + 1}.${q + 1}. ${task.questions[q].prompt}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.35)),
          const SizedBox(height: 10),
          for (var o = 0; o < task.questions[q].options.length; o++)
            _OptionTile(
              text: task.questions[q].options[o],
              selected: answers[q] == o,
              onTap: () => setState(() => _data.putIfAbsent(index, () => <int, int>{})[q] = o),
            ),
          const SizedBox(height: 10),
        ],
      ];
    }
    final question = (item as OpenExamItem).question;
    return [
      if (question.experiment) ...[
        const Align(alignment: Alignment.centerLeft, child: ExperimentTag()),
        const SizedBox(height: 8),
      ],
      Text(question.prompt, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.4)),
      const SizedBox(height: 14),
      TextField(
        key: ValueKey('open_$index'),
        controller: _textFor(index),
        minLines: 6,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        onChanged: (_) => setState(() {}),
        decoration: const InputDecoration(hintText: 'Napisz odpowiedź…', border: OutlineInputBorder()),
      ),
    ];
  }

  // ---- samoocena ----

  Widget _buildReview(BuildContext context) {
    final openIndexes = [
      for (var i = 0; i < _items.length; i++)
        if (_items[i] is OpenExamItem) i,
    ];
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: const Text('Oceń zadania otwarte')),
      body: ListView(
        // Osobne klucze etapów — każdy ekran zaczyna się od góry.
        key: const ValueKey('review'),
        padding: const EdgeInsets.all(16),
        children: [
          if (_timeUp) ...[
            const _TimeUpBanner(),
            const SizedBox(height: 12),
          ],
          const Text(
            'Porównaj swoje odpowiedzi z kluczem i zaznacz, za które elementy należą się punkty. '
            'Zadania bez odpowiedzi mają 0 pkt.',
            style: TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 14),
          for (final i in openIndexes)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _reviewCard(i),
            ),
          ElevatedButton(
            onPressed: _showResult,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text('Pokaż wynik'),
          ),
        ],
      ),
    );
  }

  Widget _reviewCard(int index) {
    final question = (_items[index] as OpenExamItem).question;
    final answer = _openText(index);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Zadanie ${index + 1}', style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 6),
          Text(question.prompt, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.4)),
          const SizedBox(height: 10),
          const Text('TWOJA ODPOWIEDŹ',
              style: TextStyle(color: AppColors.textMuted, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
          const SizedBox(height: 4),
          Text(
            answer.isEmpty ? 'Brak odpowiedzi — 0 pkt' : answer,
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: answer.isEmpty ? AppColors.orange : null,
            ),
          ),
          const SizedBox(height: 14),
          OpenAnswerReview(
            question: question,
            checked: _checked[index] ?? const <int>{},
            onToggle: answer.isEmpty
                ? null
                : (criterion) => setState(() {
                      final set = _checked.putIfAbsent(index, () => <int>{});
                      if (!set.remove(criterion)) set.add(criterion);
                    }),
          ),
        ],
      ),
    );
  }

  // ---- wynik ----

  (int, int) _section(bool Function(ExamItem item) test) {
    var points = 0;
    var max = 0;
    for (var i = 0; i < _items.length; i++) {
      if (!test(_items[i])) continue;
      points += _pointsFor(i);
      max += _items[i].maxPoints;
    }
    return (points, max);
  }

  Widget _buildResult(BuildContext context) {
    final max = examMaxPoints(_items);
    final total = _totalPoints;
    final percent = max == 0 ? 0 : (total / max * 100).round();
    final sections = [
      ('Zadania zamknięte', _section((item) => item is ClosedExamItem)),
      ('Zadania z danymi', _section((item) => item is DataExamItem)),
      ('Zadania otwarte', _section((item) => item is OpenExamItem)),
    ];
    final mistakes = _mistakes();

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text(examSpecs[widget.variant]!.title)),
      body: ListView(
        key: const ValueKey('result'),
        padding: const EdgeInsets.all(16),
        children: [
          AppCard(
            color: AppColors.greenBanner,
            borderColor: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$total / $max pkt', style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('$percent% · czas ${formatClock(_usedSeconds)}',
                    style: const TextStyle(color: Colors.white70, fontSize: 14)),
                if (_timeUp) ...[
                  const SizedBox(height: 6),
                  const Text('Arkusz zakończył się automatycznie po upływie czasu.',
                      style: TextStyle(color: Colors.white, fontSize: 13)),
                ],
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Wynik orientacyjny: zadania są przygotowane w aplikacji w stylu maturalnym i nie pochodzą z arkuszy CKE.',
            style: TextStyle(color: AppColors.textMuted, fontSize: 12, height: 1.4),
          ),
          const SizedBox(height: 16),
          AppCard(
            child: Column(
              children: [
                for (final (label, (points, sectionMax)) in sections)
                  if (sectionMax > 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
                          Text('$points / $sectionMax pkt',
                              style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('BŁĘDY I POMINIĘTE ODPOWIEDZI',
              style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 13)),
          const SizedBox(height: 10),
          if (mistakes.isEmpty)
            const AppCard(
              child: Text('Wszystkie pytania zamknięte i zadania z danymi są rozwiązane poprawnie.',
                  style: TextStyle(fontSize: 14)),
            )
          else
            ...mistakes,
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text('Zakończ'),
          ),
        ],
      ),
    );
  }

  List<Widget> _mistakes() {
    final result = <Widget>[];
    for (var i = 0; i < _items.length; i++) {
      final item = _items[i];
      if (item is ClosedExamItem && _closed[i] != item.correctIndex) {
        result.add(_MistakeCard(
          label: 'Zadanie ${i + 1}',
          prompt: item.question.question,
          given: _closed[i] == null ? null : item.options[_closed[i]!],
          correct: item.options[item.correctIndex],
          explanation: item.question.explanation,
        ));
      } else if (item is DataExamItem) {
        final answers = _data[i] ?? const <int, int>{};
        for (var q = 0; q < item.task.questions.length; q++) {
          final question = item.task.questions[q];
          if (answers[q] == question.correctIndex) continue;
          result.add(_MistakeCard(
            label: 'Zadanie ${i + 1}.${q + 1} · ${item.task.title}',
            prompt: question.prompt,
            given: answers[q] == null ? null : question.options[answers[q]!],
            correct: question.options[question.correctIndex],
            explanation: question.explanation,
          ));
        }
      }
    }
    return result;
  }
}

class _ExamClock extends StatefulWidget {
  final int Function() remainingSeconds;
  final VoidCallback onTimeUp;

  const _ExamClock({required this.remainingSeconds, required this.onTimeUp});

  @override
  State<_ExamClock> createState() => _ExamClockState();
}

class _ExamClockState extends State<_ExamClock> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (widget.remainingSeconds() <= 0) {
        _timer?.cancel();
        widget.onTimeUp();
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final remaining = widget.remainingSeconds();
    final color = remaining < 300 ? AppColors.orange : AppColors.green;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.timer_outlined, color: color, size: 18),
        const SizedBox(width: 4),
        Text(
          formatClock(remaining),
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _OptionTile({required this.text, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AppCard(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        color: selected ? AppColors.green.withValues(alpha: 0.18) : (isDark ? AppColors.darkCardAlt : AppColors.lightBg),
        borderColor: selected ? AppColors.green : Colors.transparent,
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? AppColors.green : AppColors.textMuted,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
          ],
        ),
      ),
    );
  }
}

class _TimeUpBanner extends StatelessWidget {
  const _TimeUpBanner();

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      borderColor: AppColors.orange,
      child: Row(
        children: [
          Icon(Icons.timer_off_outlined, color: AppColors.orange),
          SizedBox(width: 10),
          Expanded(child: Text('Koniec czasu — arkusz został zamknięty.', style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}

class _MistakeCard extends StatelessWidget {
  final String label;
  final String prompt;
  final String? given;
  final String correct;
  final String explanation;

  const _MistakeCard({
    required this.label,
    required this.prompt,
    required this.given,
    required this.correct,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 4),
            Text(prompt, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.35)),
            const SizedBox(height: 6),
            Text(given == null ? 'Brak odpowiedzi' : 'Twoja odpowiedź: $given',
                style: const TextStyle(color: AppColors.red, fontSize: 13)),
            Text('Poprawna odpowiedź: $correct', style: const TextStyle(color: AppColors.green, fontSize: 13)),
            const SizedBox(height: 4),
            Text(explanation, style: const TextStyle(color: AppColors.textMuted, fontSize: 12.5, height: 1.4)),
          ],
        ),
      ),
    );
  }
}
