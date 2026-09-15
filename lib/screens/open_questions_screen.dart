import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../data/open_questions.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import 'open_question_screen.dart';

class OpenQuestionsScreen extends StatefulWidget {
  const OpenQuestionsScreen({super.key});

  @override
  State<OpenQuestionsScreen> createState() => _OpenQuestionsScreenState();
}

class _OpenQuestionsScreenState extends State<OpenQuestionsScreen> {
  late int _classLevel = context.read<AppState>().selectedClassLevel;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final questions = openQuestions.where((q) => q.classLevel == _classLevel).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Zadania otwarte')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Na maturze dużą część punktów dają zadania otwarte. Napisz odpowiedź, porównaj ją z kluczem '
            'i sam zaznacz, za które elementy należy się punkt.',
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
          if (questions.isEmpty)
            const Text('Brak zadań dla tej klasy.', style: TextStyle(color: AppColors.textMuted)),
          for (final q in questions)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AppCard(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => OpenQuestionScreen(question: q))),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColors.green.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(q.experiment ? Icons.science_outlined : Icons.edit_note_rounded, color: AppColors.green),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(q.prompt,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, height: 1.3)),
                          const SizedBox(height: 4),
                          Text(
                            '${findTopicById(q.topicId)?.name ?? ''}${q.experiment ? ' · doświadczenie' : ''}',
                            style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (state.openBest.containsKey(q.id))
                      Text('${state.openBest[q.id]} / ${q.maxPoints}',
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
