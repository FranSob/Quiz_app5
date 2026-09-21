import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../logic/ai_grading.dart';
import '../logic/premium.dart';
import '../services/cloud_sync.dart';
import '../state/app_state.dart';
import '../task_models.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/open_answer_review.dart';
import 'premium_screen.dart';

/// Etykieta zadań z metodologii badań.
class ExperimentTag extends StatelessWidget {
  const ExperimentTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: AppColors.orange.withValues(alpha: 0.18), borderRadius: BorderRadius.circular(6)),
      child: const Text('Doświadczenie',
          style: TextStyle(color: AppColors.orange, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}

class OpenQuestionScreen extends StatefulWidget {
  final OpenQuestion question;

  const OpenQuestionScreen({super.key, required this.question});

  @override
  State<OpenQuestionScreen> createState() => _OpenQuestionScreenState();
}

class _OpenQuestionScreenState extends State<OpenQuestionScreen> {
  final _controller = TextEditingController();
  final Set<int> _checked = {};
  bool _revealed = false;
  bool _saved = false;
  bool _aiBusy = false;
  AiGrade? _aiGrade;
  String? _aiMessage;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _reveal() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _revealed = true);
  }

  /// Ocena przez AI: model zaznacza punkty według klucza, a uczeń może je
  /// jeszcze poprawić — ostatnie słowo zostaje po jego stronie.
  Future<void> _gradeWithAi() async {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _aiBusy = true;
      _aiMessage = null;
    });
    final result = await CloudSync.gradeOpenAnswer(question: widget.question, answer: _controller.text);
    if (!mounted) return;
    setState(() {
      _aiBusy = false;
      if (result.grade != null) {
        _aiGrade = result.grade;
        _revealed = true;
        _checked
          ..clear()
          ..addAll(result.grade!.awardedIndexes);
      } else if (result.error != null) {
        _aiMessage = aiGradingErrorMessage(result.error!);
      }
    });
  }

  void _toggle(int index) {
    setState(() {
      if (!_checked.remove(index)) _checked.add(index);
    });
  }

  void _save() {
    if (!_saved) {
      _saved = true;
      final q = widget.question;
      context.read<AppState>().recordOpenAnswer(
            topicId: q.topicId,
            questionId: q.id,
            points: openPoints(q, _checked),
            maxPoints: q.maxPoints,
          );
    }
    Navigator.of(context).pop();
  }

  Widget _aiButton(BuildContext context) {
    final locked = isFeatureLocked(
      PremiumFeature.aiGrading,
      isPremium: context.watch<AppState>().isPremium,
    );
    return OutlinedButton.icon(
      onPressed: _aiBusy
          ? null
          : locked
              ? () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PremiumScreen()))
              : _gradeWithAi,
      icon: Icon(locked ? Icons.lock_rounded : Icons.auto_awesome_rounded, size: 18),
      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
      label: Text(
        _aiBusy
            ? 'Sprawdzam…'
            : locked
                ? 'Oceń przez AI (Premium)'
                : 'Oceń przez AI',
      ),
    );
  }

  Widget _aiFeedbackCard(AiGrade grade, OpenQuestion question) {
    return AppCard(
      borderColor: AppColors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome_rounded, color: AppColors.green, size: 18),
              const SizedBox(width: 8),
              Text('Ocena AI: ${grade.points(question)} / ${question.maxPoints} pkt',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ],
          ),
          if (grade.feedback.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(grade.feedback, style: const TextStyle(fontSize: 13.5, height: 1.45)),
          ],
          const SizedBox(height: 10),
          for (final criterion in grade.criteria)
            if (criterion.comment.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      criterion.awarded ? Icons.check_circle_rounded : Icons.cancel_rounded,
                      color: criterion.awarded ? AppColors.green : AppColors.orange,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(criterion.comment,
                          style: const TextStyle(fontSize: 12.5, height: 1.4, color: AppColors.textMuted)),
                    ),
                  ],
                ),
              ),
          const SizedBox(height: 4),
          const Text(
            'To ocena orientacyjna — prawdziwy egzaminator może ocenić inaczej. '
            'Jeśli się nie zgadzasz, popraw zaznaczenia poniżej.',
            style: TextStyle(color: AppColors.textMuted, fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.question;
    return Scaffold(
      appBar: AppBar(title: const Text('Zadanie otwarte')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(findTopicById(q.topicId)?.name ?? '', style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
              if (q.experiment) const ExperimentTag(),
            ],
          ),
          const SizedBox(height: 10),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${q.maxPoints} pkt',
                    style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 6),
                Text(q.prompt, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.4)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _controller,
            readOnly: _revealed,
            minLines: 4,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'Napisz swoją odpowiedź…',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          if (!_revealed) ...[
            ElevatedButton(
              onPressed: _aiBusy ? null : _reveal,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Sprawdź z kluczem'),
            ),
            const SizedBox(height: 8),
            _aiButton(context),
            if (_aiMessage != null) ...[
              const SizedBox(height: 10),
              Text(_aiMessage!, style: const TextStyle(color: AppColors.orange, fontSize: 12.5, height: 1.4)),
            ],
          ] else ...[
            if (_aiGrade != null) ...[
              _aiFeedbackCard(_aiGrade!, q),
              const SizedBox(height: 12),
            ],
            AppCard(child: OpenAnswerReview(question: q, checked: _checked, onToggle: _toggle)),
            const SizedBox(height: 10),
            const Text(
              'Oceniaj uczciwie: punkt należy się tylko wtedy, gdy odpowiedź zawiera dany element w pełni '
              'i bez błędów merytorycznych.',
              style: TextStyle(color: AppColors.textMuted, fontSize: 12, height: 1.4),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Zapisz wynik'),
            ),
          ],
        ],
      ),
    );
  }
}
