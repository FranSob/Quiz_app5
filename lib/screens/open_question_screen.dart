import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../state/app_state.dart';
import '../task_models.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/open_answer_review.dart';

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _reveal() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _revealed = true);
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
          if (!_revealed)
            ElevatedButton(
              onPressed: _reveal,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Sprawdź z kluczem'),
            )
          else ...[
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
