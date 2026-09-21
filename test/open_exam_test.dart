import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:biomatura/data/biology_data.dart';
import 'package:biomatura/data/data_tasks.dart';
import 'package:biomatura/data/open_questions.dart';
import 'package:biomatura/logic/mock_exam.dart';
import 'package:biomatura/logic/premium.dart';
import 'package:biomatura/logic/readiness.dart';
import 'package:biomatura/models.dart';
import 'package:biomatura/state/app_state.dart';

Future<AppState> _freshState() async {
  final state = AppState();
  await state.load();
  state.clock = () => DateTime(2026, 9, 15, 10);
  return state;
}

void main() {
  group('zadania otwarte', () {
    test('ids are unique and belong to existing topics of the right class', () {
      final ids = openQuestions.map((q) => q.id).toList();
      expect(ids.toSet(), hasLength(ids.length));
      final otherIds = {
        ...allChapters.expand((c) => c.allQuestions).map((q) => q.id),
        ...dataTasks.map((t) => t.id),
        ...dataTasks.expand((t) => t.questions).map((q) => q.id),
      };
      expect(ids.where(otherIds.contains), isEmpty);
      for (final q in openQuestions) {
        expect(q.id, startsWith('oq_k${q.classLevel}_'), reason: q.id);
        expect(findTopicById(q.topicId), isNotNull, reason: q.id);
        expect(chapterOfTopic(q.topicId)!.id, startsWith('k${q.classLevel}_'), reason: q.id);
        expect(openQuestionById(q.id), same(q));
      }
      for (var level = 1; level <= 4; level++) {
        expect(openQuestions.where((q) => q.classLevel == level), isNotEmpty, reason: 'class $level');
      }
    });

    test('every question has a prompt, a model answer and scoring criteria', () {
      for (final q in openQuestions) {
        expect(q.prompt.trim(), isNotEmpty, reason: q.id);
        expect(q.modelAnswer.trim(), isNotEmpty, reason: q.id);
        expect(q.criteria, isNotEmpty, reason: q.id);
        for (final c in q.criteria) {
          expect(c.text.trim(), isNotEmpty, reason: q.id);
          expect(c.points, greaterThanOrEqualTo(1), reason: q.id);
        }
        expect(q.maxPoints, q.criteria.fold<int>(0, (s, c) => s + c.points));
      }
    });
  });

  group('próbna matura', () {
    test('sheet has the declared number of distinct items and correct answer keys', () {
      for (final variant in ExamVariant.values) {
        final spec = examSpecs[variant]!;
        for (var seed = 0; seed < 5; seed++) {
          final items = buildExam(variant, Random(seed));
          final closed = items.whereType<ClosedExamItem>().toList();
          final data = items.whereType<DataExamItem>().toList();
          final open = items.whereType<OpenExamItem>().toList();
          expect(closed, hasLength(spec.closed));
          expect(data, hasLength(spec.dataTasks));
          expect(open, hasLength(spec.open));
          expect(items, hasLength(spec.closed + spec.dataTasks + spec.open));
          expect(closed.map((i) => i.question.id).toSet(), hasLength(spec.closed));
          expect(data.map((i) => i.task.id).toSet(), hasLength(spec.dataTasks));
          expect(open.map((i) => i.question.id).toSet(), hasLength(spec.open));
          expect(items.take(spec.closed).every((i) => i is ClosedExamItem), isTrue);
          for (final item in closed) {
            expect(item.options, hasLength(item.question.options.length));
            expect(item.options.toSet(), item.question.options.toSet());
            expect(item.options[item.correctIndex], item.question.options[item.question.correctIndex]);
            expect(findTopicById(item.topicId)!.questions, contains(item.question));
          }
          expect(
            examMaxPoints(items),
            spec.closed +
                data.fold<int>(0, (s, i) => s + i.task.questions.length) +
                open.fold<int>(0, (s, i) => s + i.question.maxPoints),
          );
        }
      }
    });

    test('full sheet lasts as long as the real exam', () {
      expect(examSpecs[ExamVariant.full]!.minutes, 180);
      expect(specForId('full').title, 'Próbna matura');
      expect(specForId('nieznany').id, 'mini');
    });

    test('clock format', () {
      expect(formatClock(0), '00:00');
      expect(formatClock(65), '01:05');
      expect(formatClock(3600), '1:00:00');
      expect(formatClock(10799), '2:59:59');
      expect(formatClock(-4), '00:00');
    });
  });

  group('gotowość do matury', () {
    test('topic readiness grows with the number of answers', () {
      expect(topicReadiness(answered: 0, accuracy: 100), 0);
      expect(topicReadiness(answered: 1, accuracy: 100), 20);
      expect(topicReadiness(answered: 5, accuracy: 80), 80);
      expect(topicReadiness(answered: 12, accuracy: 50), 50);
    });

    test('report averages over all topics, classes and chapters', () {
      final topic = findTopicById('k1_chemizm_bialka')!;
      final report = buildReadinessReport(
        classes: biologyData,
        answered: (id) => id == topic.id ? 5 : 0,
        accuracy: (id) => id == topic.id ? 100 : 0,
      );
      final allTopics = biologyData.expand((c) => c.chapters).expand((c) => c.topics).length;
      final class1Topics = classByLevel(1).chapters.expand((c) => c.topics).length;
      final chapter = chapterOfTopic(topic.id)!;
      expect(report.totalTopics, allTopics);
      expect(report.topicsWithAnswers, 1);
      expect(report.overall, closeTo(100 / allTopics, 1e-9));
      expect(report.byClass[1], closeTo(100 / class1Topics, 1e-9));
      expect(report.byClass[2], 0);
      expect(
        report.chapters.firstWhere((c) => c.chapter.id == chapter.id).percent,
        closeTo(100 / chapter.topics.length, 1e-9),
      );
    });
  });

  test('the mock exam, readiness indicator and AI grading are paid', () {
    expect(paidFeatures, {PremiumFeature.mockExam, PremiumFeature.readiness, PremiumFeature.aiGrading});
    for (final feature in PremiumFeature.values) {
      expect(isFeatureLocked(feature, isPremium: false), isTrue);
      expect(isFeatureLocked(feature, isPremium: true), isFalse);
    }
  });

  group('stan aplikacji', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    test('open answers count points in topic stats and keep the best score', () async {
      final state = await _freshState();
      final q = openQuestionById('oq_k1_denaturacja')!;
      expect(q.maxPoints, 2);
      state.recordOpenAnswer(topicId: q.topicId, questionId: q.id, points: 1, maxPoints: q.maxPoints);
      expect(state.topicAnsweredCount(q.topicId), 2);
      expect(state.topicAccuracy(q.topicId), 50);
      expect(state.openBest[q.id], 1);
      state.recordOpenAnswer(topicId: q.topicId, questionId: q.id, points: 5, maxPoints: q.maxPoints);
      expect(state.openBest[q.id], 2);
      state.recordOpenAnswer(topicId: q.topicId, questionId: q.id, points: 0, maxPoints: q.maxPoints);
      expect(state.openBest[q.id], 2);
      expect(state.topicAnsweredCount(q.topicId), 6);
      expect(state.topicAccuracy(q.topicId), 50);
      expect(state.todayStat.openAnswers, 3);
      expect(state.readinessHistory['2026-09-15'], state.readinessReport.overall.round());
    });

    test('exam history, open scores and readiness history are saved', () async {
      final state = await _freshState();
      state.recordOpenAnswer(topicId: 'k1_chemizm_bialka', questionId: 'oq_k1_denaturacja', points: 2, maxPoints: 2);
      state.completeExam(const ExamRecord(dateKey: '2026-09-15', variant: 'full', points: 40, maxPoints: 62, seconds: 5400));
      await Future<void>.delayed(Duration.zero);

      final reloaded = await _freshState();
      final record = reloaded.examHistory.single;
      expect(record.variant, 'full');
      expect(record.points, 40);
      expect(record.maxPoints, 62);
      expect(record.seconds, 5400);
      expect(reloaded.openBest['oq_k1_denaturacja'], 2);
      expect(reloaded.readinessHistory['2026-09-15'], isNotNull);
      expect(reloaded.dailyStats['2026-09-15']!.openAnswers, 1);
      expect(reloaded.dailyStats['2026-09-15']!.tests, 1);
    });

    test('daily plan includes an open question from a topic already read', () async {
      final empty = await _freshState();
      empty.setExamDate(DateTime(2027, 5, 10));
      expect(empty.todayPlan().openQuestion, isNull);

      SharedPreferences.setMockInitialValues({});
      final state = await _freshState();
      state.setExamDate(DateTime(2027, 5, 10));
      state.markTopicRead('k1_metabolizm_enzymy');
      final plan = state.todayPlan();
      final expected = openQuestions.firstWhere((q) => q.topicId == 'k1_metabolizm_enzymy');
      expect(plan.openQuestion?.id, expected.id);
      expect(plan.openDoneToday, isFalse);

      state.recordOpenAnswer(topicId: expected.topicId, questionId: expected.id, points: 1, maxPoints: expected.maxPoints);
      final updated = state.todayPlan();
      expect(updated.openQuestion?.id, expected.id);
      expect(updated.openDoneToday, isTrue);
    });
  });
}
