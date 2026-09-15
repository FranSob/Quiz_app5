import 'package:flutter_test/flutter_test.dart';

import 'package:biomatura/logic/study_plan.dart';
import 'package:biomatura/screens/study_plan_screen.dart';
import 'package:biomatura/utils/dates.dart';

void main() {
  final today = DateTime(2026, 9, 15, 14, 30);

  group('dates', () {
    test('counts calendar days, ignoring the daylight saving change', () {
      expect(daysBetween(DateTime(2026, 3, 28, 23), DateTime(2026, 3, 30, 1)), 2);
      expect(daysBetween(DateTime(2026, 10, 24, 12), DateTime(2026, 10, 26, 0)), 2);
      expect(daysBetween(today, today), 0);
    });

    test('parses only valid date keys', () {
      expect(parseDateKey('2027-05-10'), DateTime(2027, 5, 10));
      expect(parseDateKey('2027-02-30'), isNull);
      expect(parseDateKey('abc'), isNull);
      expect(parseDateKey(null), isNull);
      expect(dateKey(DateTime(2027, 5, 1)), '2027-05-01');
    });

    test('formats Polish dates', () {
      expect(formatDatePl(DateTime(2027, 5, 10)), '10 maja 2027');
      expect(formatDatePl(DateTime(2026, 9, 1)), '1 września 2026');
    });
  });

  group('summarizePlan', () {
    test('without an exam date', () {
      final s = summarizePlan(today: today, examDate: null, remainingTopics: 10);
      expect(s.phase, PlanPhase.noExamDate);
    });

    test('exam in the past, today', () {
      expect(summarizePlan(today: today, examDate: DateTime(2026, 9, 14), remainingTopics: 5).phase, PlanPhase.examPassed);
      expect(summarizePlan(today: today, examDate: DateTime(2026, 9, 15), remainingTopics: 5).phase, PlanPhase.examToday);
    });

    test('last week before the exam is revision only', () {
      final s = summarizePlan(today: today, examDate: DateTime(2026, 9, 22), remainingTopics: 40);
      expect(s.daysLeft, 7);
      expect(s.phase, PlanPhase.revision);
      expect(s.topicsPerDay, 0);
    });

    test('nothing left to learn means revision', () {
      final s = summarizePlan(today: today, examDate: DateTime(2027, 5, 10), remainingTopics: 0);
      expect(s.phase, PlanPhase.revision);
    });

    test('long horizon keeps three weeks for revision', () {
      final exam = today.add(const Duration(days: 100));
      final s = summarizePlan(today: today, examDate: exam, remainingTopics: 79);
      expect(s.phase, PlanPhase.learning);
      expect(s.learningDays, 100 - longRevisionDays);
      expect(s.topicsPerDay, 1);
      expect(s.behindSchedule, isFalse);
    });

    test('short horizon keeps one week and spreads topics evenly', () {
      final exam = DateTime(2026, 10, 5); // 20 days
      final s = summarizePlan(today: today, examDate: exam, remainingTopics: 60);
      expect(s.daysLeft, 20);
      expect(s.learningDays, 13);
      expect(s.topicsPerDay, 5); // ceil(60 / 13)
      expect(s.behindSchedule, isFalse);
    });

    test('caps topics per day and reports being behind schedule', () {
      final s = summarizePlan(today: today, examDate: DateTime(2026, 10, 5), remainingTopics: 70);
      expect(s.topicsPerDay, maxTopicsPerDay);
      expect(s.behindSchedule, isTrue);
    });
  });

  test('pickNext skips finished items and keeps program order', () {
    final picked = pickNext([1, 2, 3, 4, 5, 6], (n) => n.isEven, 2);
    expect(picked, [1, 3]);
    expect(pickNext([2, 4], (n) => n.isEven, 3), isEmpty);
  });

  test('Polish labels for days left', () {
    expect(daysLeftLabel(1), 'Został 1 dzień');
    expect(daysLeftLabel(3), 'Zostały 3 dni');
    expect(daysLeftLabel(12), 'Zostało 12 dni');
    expect(daysLeftLabel(22), 'Zostały 22 dni');
    expect(daysLeftLabel(147), 'Zostało 147 dni');
  });
}
