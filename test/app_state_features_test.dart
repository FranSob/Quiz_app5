import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:biomatura/data/biology_data.dart';
import 'package:biomatura/logic/study_plan.dart';
import 'package:biomatura/models.dart';
import 'package:biomatura/state/app_state.dart';
import 'package:biomatura/utils/dates.dart';

Future<AppState> _freshState() async {
  final state = AppState();
  await state.load();
  return state;
}

void _answer(AppState state, Topic topic, int questionIndex, bool correct) {
  state.recordTestAnswer(
    topicId: topic.id,
    chapterId: chapterOfTopic(topic.id)!.id,
    questionId: topic.questions[questionIndex].id,
    correct: correct,
  );
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('luki', () {
    test('wrong answers create a gap and are practised first', () async {
      final state = await _freshState();
      final topic = findTopicById('k1_chemizm_bialka')!;
      _answer(state, topic, 0, false);
      _answer(state, topic, 1, false);
      _answer(state, topic, 2, false);
      _answer(state, topic, 3, true);

      final gaps = state.topicGaps();
      expect(gaps, hasLength(1));
      expect(gaps.first.topic.id, topic.id);
      expect(gaps.first.accuracy, 25);
      expect(gaps.first.weakInTests, isTrue);
      expect(gaps.first.wrongQuestions, 3);

      final items = state.gapPracticeItems(gaps);
      expect(items, hasLength(topic.questions.length.clamp(0, 10)));
      expect(
        items.take(3).map((i) => i.question.id).toSet(),
        {topic.questions[0].id, topic.questions[1].id, topic.questions[2].id},
      );

      _answer(state, topic, 0, true);
      expect(state.wrongQuestionIds, isNot(contains(topic.questions[0].id)));
    });

    test('fewer than three answers is not enough evidence for a gap', () async {
      final state = await _freshState();
      final topic = findTopicById('k1_chemizm_bialka')!;
      _answer(state, topic, 0, false);
      _answer(state, topic, 1, false);
      expect(state.topicGaps(), isEmpty);
    });

    test('flashcards marked "Nie umiem" create a gap', () async {
      final state = await _freshState();
      final topic = findTopicById('k3_krazenie_serce')!;
      for (final card in topic.flashcards.take(3)) {
        state.reviewFlashcard(card.id, false);
      }
      final gaps = state.topicGaps(classLevel: 3);
      expect(gaps.single.topic.id, topic.id);
      expect(gaps.single.weakInFlashcards, isTrue);
      expect(state.lapsedCardsFor(gaps), hasLength(3));

      state.reviewFlashcard(topic.flashcards.first.id, true);
      expect(state.topicGaps(classLevel: 3), isEmpty);
    });
  });

  group('plan nauki', () {
    test('plan follows the program order and stays stable during the day', () async {
      final state = await _freshState();
      state.clock = () => DateTime(2026, 9, 15, 10);
      state.setExamDate(DateTime(2027, 5, 10));

      final plan = state.todayPlan();
      expect(plan.summary.phase, PlanPhase.learning);
      expect(plan.summary.daysLeft, daysBetween(DateTime(2026, 9, 15), DateTime(2027, 5, 10)));
      final first = allChapters.first.topics.first;
      expect(plan.topics.first.id, first.id);
      expect(plan.cardsTarget, 30);

      state.markTopicRead(first.id);
      for (var i = 0; i < first.questions.length && i < 5; i++) {
        _answer(state, first, i, true);
      }
      final sameDay = state.todayPlan();
      expect(sameDay.topics.map((t) => t.id), plan.topics.map((t) => t.id));
      expect(sameDay.isTopicDone(first), isTrue);
      expect(state.isTopicDone(first), isTrue);

      state.clock = () => DateTime(2026, 9, 16, 10);
      final nextDay = state.todayPlan();
      expect(nextDay.topics.map((t) => t.id), isNot(contains(first.id)));
      expect(nextDay.isTopicDone(first), isFalse);
    });

    test('daily progress counts flashcards and tests done today', () async {
      final state = await _freshState();
      state.clock = () => DateTime(2026, 9, 15, 10);
      state.setExamDate(DateTime(2027, 5, 10));
      final plan = state.todayPlan();
      for (final card in state.dueFlashcards().take(plan.cardsTarget)) {
        state.reviewFlashcard(card.id, true);
      }
      state.completeTest(perfect: false);
      final updated = state.todayPlan();
      expect(updated.cardsDone, isTrue);
      expect(updated.testDoneToday, isTrue);
    });
  });

  group('sprawdziany i trwałość danych', () {
    test('past planned tests are hidden and upcoming ones are sorted', () async {
      final state = await _freshState();
      state.clock = () => DateTime(2026, 9, 15, 10);
      state.addPlannedTest(date: DateTime(2026, 9, 30), classLevel: 2, chapterIds: ['k2_grzyby']);
      state.addPlannedTest(date: DateTime(2026, 9, 14), classLevel: 2, chapterIds: ['k2_protisty']);
      state.addPlannedTest(date: DateTime(2026, 9, 15), classLevel: 1, chapterIds: ['k1_chemizm']);
      state.addPlannedTest(date: DateTime(2026, 9, 20), classLevel: 1, chapterIds: []);
      final upcoming = state.upcomingPlannedTests;
      expect(upcoming.map((t) => t.dateKey), ['2026-09-15', '2026-09-30']);
    });

    test('new data is saved and loaded again', () async {
      final state = await _freshState();
      final topic = findTopicById('k4_ekologia_populacje')!;
      state.setExamDate(DateTime(2027, 5, 12));
      state.addPlannedTest(date: DateTime(2030, 1, 10), classLevel: 4, chapterIds: ['k4_ekologia']);
      state.completeDataTask('dt_k4_wzrost_populacji', 3);
      state.completeDataTask('dt_k4_wzrost_populacji', 2);
      _answer(state, topic, 0, false);
      await Future<void>.delayed(Duration.zero);

      final reloaded = await _freshState();
      expect(reloaded.examDateKey, '2027-05-12');
      expect(reloaded.plannedTests.single.chapterIds, ['k4_ekologia']);
      expect(reloaded.dataTaskBest['dt_k4_wzrost_populacji'], 3);
      expect(reloaded.wrongQuestionIds, contains(topic.questions[0].id));
    });
  });
}
