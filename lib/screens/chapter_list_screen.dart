import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/progress_ring.dart';
import 'chapter_detail_screen.dart';

enum ChapterListMode { quiz, theory }

class ChapterListScreen extends StatelessWidget {
  final ChapterListMode mode;
  const ChapterListScreen({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final classData = classByLevel(state.selectedClassLevel);
    final title = mode == ChapterListMode.quiz ? 'Testy' : 'Teoria';

    return Scaffold(
      appBar: AppBar(title: Text('$title — ${classData.label}')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: classData.chapters.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) {
          final chapter = classData.chapters[i];
          return AppCard(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ChapterDetailScreen(chapter: chapter),
            )),
            child: Row(
              children: [
                ProgressRing(percent: state.chapterProgressPercent(chapter), size: 40),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(chapter.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('${chapter.topicCount} ${chapter.topicCount == 1 ? 'temat' : 'tematy'}',
                          style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
              ],
            ),
          );
        },
      ),
    );
  }
}
