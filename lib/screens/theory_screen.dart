import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import 'flashcards_screen.dart';
import 'quiz_screen.dart';

class TheoryScreen extends StatefulWidget {
  final Topic topic;
  const TheoryScreen({super.key, required this.topic});

  @override
  State<TheoryScreen> createState() => _TheoryScreenState();
}

class _TheoryScreenState extends State<TheoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppState>().markTopicRead(widget.topic.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sections = widget.topic.theory.trim().split('\n\n');
    return Scaffold(
      appBar: AppBar(title: Text(widget.topic.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...sections.map((section) {
            final lines = section.trim().split('\n');
            final isHeading = lines.first == lines.first.toUpperCase() && lines.first.length > 3 && lines.length > 1;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isHeading) ...[
                      Text(lines.first,
                          style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0.3)),
                      const SizedBox(height: 8),
                      Text(lines.skip(1).join('\n'), style: const TextStyle(fontSize: 14, height: 1.5)),
                    ] else
                      Text(section, style: const TextStyle(fontSize: 14, height: 1.5)),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: widget.topic.flashcards.isEmpty
                      ? null
                      : () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => FlashcardsScreen(cards: widget.topic.flashcards, title: widget.topic.name),
                          )),
                  icon: const Icon(Icons.style_outlined),
                  label: const Text('Fiszki'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: widget.topic.questions.isEmpty
                      ? null
                      : () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => QuizScreen(
                              chapterId: chapterOfTopic(widget.topic.id)?.id ?? widget.topic.id,
                              title: widget.topic.name,
                              items: widget.topic.questions
                                  .map((q) => QuizItem(question: q, topicId: widget.topic.id))
                                  .toList(),
                            ),
                          )),
                  icon: const Icon(Icons.description_outlined),
                  label: const Text('Rozwiąż test'),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
