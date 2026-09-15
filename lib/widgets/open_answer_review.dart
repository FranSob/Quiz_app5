import 'package:flutter/material.dart';

import '../task_models.dart';
import '../theme.dart';

/// Suma punktów za zaznaczone kryteria.
int openPoints(OpenQuestion question, Set<int> checked) =>
    checked.fold(0, (sum, i) => sum + question.criteria[i].points);

/// Odpowiedź wzorcowa i lista kryteriów do samodzielnej oceny.
/// Gdy [onToggle] jest null, kryteria są tylko do odczytu.
class OpenAnswerReview extends StatelessWidget {
  final OpenQuestion question;
  final Set<int> checked;
  final ValueChanged<int>? onToggle;

  const OpenAnswerReview({super.key, required this.question, required this.checked, this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('ODPOWIEDŹ WZORCOWA',
            style: TextStyle(color: AppColors.green, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        const SizedBox(height: 6),
        Text(question.modelAnswer, style: const TextStyle(fontSize: 14, height: 1.45)),
        const SizedBox(height: 14),
        const Text('Zaznacz elementy, które zawiera Twoja odpowiedź:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 4),
        for (var i = 0; i < question.criteria.length; i++)
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: AppColors.green,
            checkColor: Colors.black,
            value: checked.contains(i),
            onChanged: onToggle == null ? null : (_) => onToggle!(i),
            title: Text(question.criteria[i].text, style: const TextStyle(fontSize: 13.5, height: 1.35)),
            subtitle: Text('${question.criteria[i].points} pkt', style: const TextStyle(fontSize: 12)),
          ),
        const SizedBox(height: 4),
        Text('Wynik: ${openPoints(question, checked)} / ${question.maxPoints} pkt',
            style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 15)),
      ],
    );
  }
}
