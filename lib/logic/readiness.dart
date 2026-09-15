import '../models.dart';

/// Od tylu odpowiedzi w temacie jego wynik liczy się w pełni.
const int readinessFullAnswers = 5;

/// Gotowość w temacie: skuteczność pomnożona przez pewność wyniku.
/// Temat bez odpowiedzi ma 0%, a jedna trafna odpowiedź to 20%, nie 100%.
double topicReadiness({required int answered, required double accuracy}) {
  if (answered <= 0) return 0;
  final confidence = (answered >= readinessFullAnswers ? readinessFullAnswers : answered) / readinessFullAnswers;
  return accuracy * confidence;
}

class ChapterReadiness {
  final Chapter chapter;
  final int classLevel;
  final double percent;

  const ChapterReadiness({required this.chapter, required this.classLevel, required this.percent});
}

class ReadinessReport {
  /// Średnia gotowość ze wszystkich tematów programu (0–100).
  final double overall;
  final Map<int, double> byClass;
  final List<ChapterReadiness> chapters;
  final int topicsWithAnswers;
  final int totalTopics;

  const ReadinessReport({
    required this.overall,
    required this.byClass,
    required this.chapters,
    required this.topicsWithAnswers,
    required this.totalTopics,
  });
}

ReadinessReport buildReadinessReport({
  required List<ClassData> classes,
  required int Function(String topicId) answered,
  required double Function(String topicId) accuracy,
}) {
  var sum = 0.0;
  var total = 0;
  var withAnswers = 0;
  final byClass = <int, double>{};
  final chapters = <ChapterReadiness>[];
  for (final classData in classes) {
    var classSum = 0.0;
    var classTopics = 0;
    for (final chapter in classData.chapters) {
      var chapterSum = 0.0;
      for (final topic in chapter.topics) {
        final n = answered(topic.id);
        final value = topicReadiness(answered: n, accuracy: accuracy(topic.id));
        if (n > 0) withAnswers++;
        chapterSum += value;
      }
      if (chapter.topics.isNotEmpty) {
        chapters.add(ChapterReadiness(
          chapter: chapter,
          classLevel: classData.level,
          percent: chapterSum / chapter.topics.length,
        ));
      }
      classSum += chapterSum;
      classTopics += chapter.topics.length;
    }
    byClass[classData.level] = classTopics == 0 ? 0 : classSum / classTopics;
    sum += classSum;
    total += classTopics;
  }
  return ReadinessReport(
    overall: total == 0 ? 0 : sum / total,
    byClass: byClass,
    chapters: chapters,
    topicsWithAnswers: withAnswers,
    totalTopics: total,
  );
}
