import 'dart:math';

import '../models.dart';

class SchoolGrade {
  final int value;
  final String name;
  final int minPercent;

  const SchoolGrade(this.value, this.name, this.minPercent);
}

/// Typowa skala procentowa ocen ze sprawdzianów. Progi różnią się między
/// szkołami, dlatego aplikacja przedstawia ocenę jako orientacyjną.
const List<SchoolGrade> schoolGradeScale = [
  SchoolGrade(6, 'celujący', 100),
  SchoolGrade(5, 'bardzo dobry', 90),
  SchoolGrade(4, 'dobry', 75),
  SchoolGrade(3, 'dostateczny', 55),
  SchoolGrade(2, 'dopuszczający', 40),
  SchoolGrade(1, 'niedostateczny', 0),
];

SchoolGrade gradeFor(int correct, int total) {
  if (total <= 0) return schoolGradeScale.last;
  final percent = correct / total * 100;
  for (final grade in schoolGradeScale) {
    if (percent >= grade.minPercent) return grade;
  }
  return schoolGradeScale.last;
}

/// Losuje pytania na sprawdzian tak, żeby każdy temat był reprezentowany:
/// pytania dobiera się po kolei z kolejnych tematów, aż uzbiera się [count].
List<QuizItem> sampleTestQuestions(List<Topic> topics, int count, Random random) {
  final pools = [
    for (final t in topics)
      if (t.questions.isNotEmpty)
        (t.questions.map((q) => QuizItem(question: q, topicId: t.id)).toList()..shuffle(random)),
  ]..shuffle(random);
  final result = <QuizItem>[];
  var round = 0;
  while (result.length < count) {
    var added = false;
    for (final pool in pools) {
      if (result.length >= count) break;
      if (round < pool.length) {
        result.add(pool[round]);
        added = true;
      }
    }
    if (!added) break;
    round++;
  }
  return result;
}
