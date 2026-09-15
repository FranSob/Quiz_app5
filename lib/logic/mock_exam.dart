import 'dart:math';

import '../data/biology_data.dart';
import '../data/data_tasks.dart';
import '../data/open_questions.dart';
import '../models.dart';
import '../task_models.dart';
import 'school_test.dart';

enum ExamVariant { mini, full }

class ExamSpec {
  final String id;
  final String title;
  final int minutes;
  final int closed;
  final int dataTasks;
  final int open;

  const ExamSpec({
    required this.id,
    required this.title,
    required this.minutes,
    required this.closed,
    required this.dataTasks,
    required this.open,
  });
}

/// Pełna wersja trwa jak matura (180 minut) i daje około 60 punktów.
const Map<ExamVariant, ExamSpec> examSpecs = {
  ExamVariant.mini: ExamSpec(id: 'mini', title: 'Mini-matura', minutes: 60, closed: 12, dataTasks: 2, open: 3),
  ExamVariant.full: ExamSpec(id: 'full', title: 'Próbna matura', minutes: 180, closed: 30, dataTasks: 6, open: 10),
};

ExamSpec specForId(String id) =>
    examSpecs.values.firstWhere((s) => s.id == id, orElse: () => examSpecs[ExamVariant.mini]!);

abstract class ExamItem {
  const ExamItem();

  int get maxPoints;

  String get topicId;
}

class ClosedExamItem extends ExamItem {
  final QuizQuestion question;
  @override
  final String topicId;

  /// Odpowiedzi w wylosowanej kolejności.
  final List<String> options;
  final int correctIndex;

  const ClosedExamItem({
    required this.question,
    required this.topicId,
    required this.options,
    required this.correctIndex,
  });

  @override
  int get maxPoints => 1;
}

class DataExamItem extends ExamItem {
  final DataTask task;

  const DataExamItem(this.task);

  @override
  String get topicId => task.topicId;

  @override
  int get maxPoints => task.questions.length;
}

class OpenExamItem extends ExamItem {
  final OpenQuestion question;

  const OpenExamItem(this.question);

  @override
  String get topicId => question.topicId;

  @override
  int get maxPoints => question.maxPoints;
}

/// Losuje arkusz: pytania zamknięte z różnych tematów całego programu,
/// zadania z danymi i zadania otwarte — w tej kolejności, jak części arkusza.
List<ExamItem> buildExam(ExamVariant variant, Random random) {
  final spec = examSpecs[variant]!;
  final topics = allChapters.expand((c) => c.topics).toList();
  final closed = [
    for (final item in sampleTestQuestions(topics, spec.closed, random)) _shuffled(item, random),
  ];
  final data = ([...dataTasks]..shuffle(random)).take(spec.dataTasks).map(DataExamItem.new);
  final open = ([...openQuestions]..shuffle(random)).take(spec.open).map(OpenExamItem.new);
  return [...closed, ...data, ...open];
}

ClosedExamItem _shuffled(QuizItem item, Random random) {
  final q = item.question;
  final order = List<int>.generate(q.options.length, (i) => i)..shuffle(random);
  return ClosedExamItem(
    question: q,
    topicId: item.topicId,
    options: [for (final i in order) q.options[i]],
    correctIndex: order.indexOf(q.correctIndex),
  );
}

int examMaxPoints(List<ExamItem> items) => items.fold(0, (sum, item) => sum + item.maxPoints);

/// „1:05:09" albo „05:09".
String formatClock(int seconds) {
  final s = seconds < 0 ? 0 : seconds;
  final h = s ~/ 3600;
  final m = (s % 3600) ~/ 60;
  final sec = s % 60;
  final mm = m.toString().padLeft(2, '0');
  final ss = sec.toString().padLeft(2, '0');
  return h > 0 ? '$h:$mm:$ss' : '$mm:$ss';
}
