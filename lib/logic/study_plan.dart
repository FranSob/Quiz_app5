import '../models.dart';
import '../task_models.dart';
import '../utils/dates.dart';

/// Ile nowych tematów dziennie da się sensownie przerobić. Jeśli do matury
/// zostało za mało dni, plan nie wymaga więcej, tylko uczciwie o tym mówi.
const int maxTopicsPerDay = 5;

/// Ostatni tydzień przed maturą to zawsze wyłącznie powtórka.
const int finalRevisionDays = 7;

/// Przy dłuższym horyzoncie zostawiamy na powtórkę trzy tygodnie.
const int longRevisionDays = 21;

enum PlanPhase { noExamDate, examPassed, examToday, learning, revision }

class StudyPlanSummary {
  final PlanPhase phase;
  final int daysLeft;
  final int remainingTopics;

  /// Ile nowych tematów przypada na dziś (0 w fazie powtórki).
  final int topicsPerDay;

  /// Dni przeznaczone na naukę nowego materiału, zanim zacznie się powtórka.
  final int learningDays;

  /// True, gdy nawet przy [maxTopicsPerDay] nie da się przerobić wszystkiego.
  final bool behindSchedule;

  const StudyPlanSummary({
    required this.phase,
    required this.daysLeft,
    required this.remainingTopics,
    this.topicsPerDay = 0,
    this.learningDays = 0,
    this.behindSchedule = false,
  });
}

/// Rozkłada pozostały materiał na dni, licząc wstecz od daty matury.
StudyPlanSummary summarizePlan({
  required DateTime today,
  required DateTime? examDate,
  required int remainingTopics,
}) {
  if (examDate == null) {
    return StudyPlanSummary(phase: PlanPhase.noExamDate, daysLeft: 0, remainingTopics: remainingTopics);
  }
  final daysLeft = daysBetween(today, examDate);
  if (daysLeft < 0) {
    return StudyPlanSummary(phase: PlanPhase.examPassed, daysLeft: daysLeft, remainingTopics: remainingTopics);
  }
  if (daysLeft == 0) {
    return StudyPlanSummary(phase: PlanPhase.examToday, daysLeft: 0, remainingTopics: remainingTopics);
  }
  if (remainingTopics == 0 || daysLeft <= finalRevisionDays) {
    return StudyPlanSummary(phase: PlanPhase.revision, daysLeft: daysLeft, remainingTopics: remainingTopics);
  }
  final reserve = daysLeft > longRevisionDays + finalRevisionDays ? longRevisionDays : finalRevisionDays;
  final learningDays = daysLeft - reserve;
  final needed = (remainingTopics / learningDays).ceil();
  return StudyPlanSummary(
    phase: PlanPhase.learning,
    daysLeft: daysLeft,
    remainingTopics: remainingTopics,
    topicsPerDay: needed > maxTopicsPerDay ? maxTopicsPerDay : needed,
    learningDays: learningDays,
    behindSchedule: needed > maxTopicsPerDay,
  );
}

/// Pierwsze [count] elementów w kolejności programu, które nie są jeszcze zrobione.
List<T> pickNext<T>(List<T> ordered, bool Function(T) isDone, int count) {
  final result = <T>[];
  for (final item in ordered) {
    if (result.length >= count) break;
    if (!isDone(item)) result.add(item);
  }
  return result;
}

/// Plan na dziś wraz z postępem jego realizacji.
class DailyPlan {
  final StudyPlanSummary summary;
  final List<Topic> topics;
  final Set<String> topicsReadToday;
  final int cardsTarget;
  final int cardsReviewedToday;

  /// Temat testu na dziś: największa luka albo pierwszy temat z planu.
  final Topic? testTopic;
  final bool testFromGaps;
  final bool testDoneToday;
  final DataTask? dataTask;
  final bool dataTaskDoneToday;

  const DailyPlan({
    required this.summary,
    this.topics = const [],
    this.topicsReadToday = const {},
    this.cardsTarget = 0,
    this.cardsReviewedToday = 0,
    this.testTopic,
    this.testFromGaps = false,
    this.testDoneToday = false,
    this.dataTask,
    this.dataTaskDoneToday = false,
  });

  bool get isActive => summary.phase == PlanPhase.learning || summary.phase == PlanPhase.revision;

  bool isTopicDone(Topic t) => topicsReadToday.contains(t.id);

  bool get cardsDone => cardsReviewedToday >= cardsTarget;

  int get totalItems =>
      topics.length + (cardsTarget > 0 ? 1 : 0) + (testTopic != null ? 1 : 0) + (dataTask != null ? 1 : 0);

  int get doneItems =>
      topics.where(isTopicDone).length +
      (cardsTarget > 0 && cardsDone ? 1 : 0) +
      (testTopic != null && testDoneToday ? 1 : 0) +
      (dataTask != null && dataTaskDoneToday ? 1 : 0);
}
