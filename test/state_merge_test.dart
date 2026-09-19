import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:biomatura/data/biology_data.dart';
import 'package:biomatura/logic/state_merge.dart';
import 'package:biomatura/models.dart';
import 'package:biomatura/state/app_state.dart';

Future<AppState> _state(DateTime now) async {
  SharedPreferences.setMockInitialValues({});
  final state = AppState();
  await state.load();
  state.clock = () => now;
  return state;
}

void main() {
  group('scalanie postępu', () {
    test('counters, best scores and sets never go down', () {
      final a = {
        'updatedAt': 200,
        'totalXp': 300,
        'testsCompleted': 5,
        'anyPerfectTest': false,
        'topicAnswered': {'t1': 10, 't2': 3},
        'openBest': {'oq1': 2},
        'readTopics': ['t1'],
        'unlockedBadges': ['first_test'],
      };
      final b = {
        'updatedAt': 100,
        'totalXp': 120,
        'testsCompleted': 9,
        'anyPerfectTest': true,
        'topicAnswered': {'t1': 4, 't3': 7},
        'openBest': {'oq1': 1, 'oq2': 3},
        'readTopics': ['t2'],
        'unlockedBadges': ['theorist'],
      };
      final merged = mergeStates(a, b);
      expect(merged['totalXp'], 300);
      expect(merged['testsCompleted'], 9);
      expect(merged['anyPerfectTest'], isTrue);
      expect(merged['topicAnswered'], {'t1': 10, 't2': 3, 't3': 7});
      expect(merged['openBest'], {'oq1': 2, 'oq2': 3});
      expect(merged['readTopics'], containsAll(['t1', 't2']));
      expect(merged['unlockedBadges'], containsAll(['first_test', 'theorist']));
      expect(merged['updatedAt'], 200);
    });

    test('settings and the daily plan come from the newer save', () {
      final older = {'updatedAt': 1, 'userName': 'Stare', 'examDate': '2027-05-10', 'plan': {'day': '2026-09-18'}};
      final newer = {'updatedAt': 2, 'userName': 'Nowe', 'examDate': '2027-05-12', 'plan': {'day': '2026-09-19'}};
      for (final merged in [mergeStates(older, newer), mergeStates(newer, older)]) {
        expect(merged['userName'], 'Nowe');
        expect(merged['examDate'], '2027-05-12');
        expect(merged['plan'], {'day': '2026-09-19'});
      }
    });

    test('flashcard repetitions keep the further advanced card', () {
      final merged = mergeStates(
        {
          'updatedAt': 5,
          'srs': {
            'c1': {'b': 3, 'd': 900, 'r': 4, 'l': 1},
            'c2': {'b': 0, 'd': 0, 'r': 0, 'l': 0},
          },
        },
        {
          'updatedAt': 9,
          'srs': {
            'c1': {'b': 1, 'd': 100, 'r': 2, 'l': 0},
            'c3': {'b': 2, 'd': 500, 'r': 3, 'l': 0},
          },
        },
      );
      final srs = Map<String, dynamic>.from(merged['srs'] as Map);
      expect(srs['c1']['r'], 4);
      expect(srs.keys, containsAll(['c1', 'c2', 'c3']));
    });

    test('daily stats take the larger counter of each day and union the topics read', () {
      final merged = mergeStates(
        {
          'updatedAt': 1,
          'dailyStats': {
            '2026-09-18': {'a': 10, 'c': 6, 'f': 30, 't': 1, 'd': 0, 'o': 2, 'r': ['t1']},
          },
        },
        {
          'updatedAt': 2,
          'dailyStats': {
            '2026-09-18': {'a': 4, 'c': 4, 'f': 40, 't': 0, 'd': 1, 'o': 0, 'r': ['t2']},
            '2026-09-19': {'a': 5, 'c': 5, 'f': 0, 't': 1, 'd': 0, 'o': 0, 'r': []},
          },
        },
      );
      final daily = Map<String, dynamic>.from(merged['dailyStats'] as Map);
      expect(daily['2026-09-18']['a'], 10);
      expect(daily['2026-09-18']['f'], 40);
      expect(daily['2026-09-18']['d'], 1);
      expect(daily['2026-09-18']['r'], containsAll(['t1', 't2']));
      expect(daily.keys, hasLength(2));
    });

    test('exam history is joined without duplicating the same sheet', () {
      final record = {'date': '2026-09-14', 'variant': 'mini', 'points': 18, 'max': 26, 'seconds': 2710};
      final other = {'date': '2026-09-15', 'variant': 'full', 'points': 40, 'max': 62, 'seconds': 5400};
      final merged = mergeStates(
        {'updatedAt': 1, 'examHistory': [record, other]},
        {'updatedAt': 2, 'examHistory': [record]},
      );
      expect(merged['examHistory'], hasLength(2));
      expect((merged['examHistory'] as List).first, record);
    });

    test('planned tests and flashcard folders are joined by id, newer wins', () {
      final merged = mergeStates(
        {
          'updatedAt': 9,
          'customFolders': [
            {'id': 'f1', 'name': 'Nowa nazwa', 'cards': []},
          ],
          'plannedTests': [
            {'id': 't1', 'date': '2026-09-30', 'class': 2, 'chapters': ['k2_grzyby']},
          ],
        },
        {
          'updatedAt': 1,
          'customFolders': [
            {'id': 'f1', 'name': 'Stara nazwa', 'cards': []},
            {'id': 'f2', 'name': 'Drugi zestaw', 'cards': []},
          ],
          'plannedTests': [
            {'id': 't2', 'date': '2026-10-05', 'class': 1, 'chapters': ['k1_chemizm']},
          ],
        },
      );
      final folders = List<dynamic>.from(merged['customFolders'] as List);
      expect(folders, hasLength(2));
      expect(folders.firstWhere((f) => f['id'] == 'f1')['name'], 'Nowa nazwa');
      expect(merged['plannedTests'], hasLength(2));
    });
  });

  group('synchronizacja z chmurą', () {
    test('first sync uploads the local progress', () async {
      final state = await _state(DateTime(2026, 9, 19, 10));
      state.markTopicRead('k1_chemizm_bialka');
      Map<String, dynamic>? pushed;
      final outcome = await state.syncWith(
        fetch: () async => null,
        push: (data) async => pushed = data,
      );
      expect(outcome, SyncOutcome.uploaded);
      expect(pushed!['readTopics'], contains('k1_chemizm_bialka'));
    });

    test('progress from another device is merged in both directions', () async {
      final state = await _state(DateTime(2026, 9, 19, 10));
      final topic = findTopicById('k1_chemizm_bialka')!;
      state.recordTestAnswer(
        topicId: topic.id,
        chapterId: chapterOfTopic(topic.id)!.id,
        questionId: topic.questions.first.id,
        correct: true,
      );
      // Drugie urządzenie: inny postęp, zapisany później.
      final remote = {
        'updatedAt': state.stateUpdatedAt + 1000,
        'totalXp': 5000,
        'readTopics': ['k2_grzyby_budowa'],
        'examHistory': [
          const ExamRecord(dateKey: '2026-09-18', variant: 'mini', points: 20, maxPoints: 26, seconds: 1800).toJson(),
        ],
      };
      Map<String, dynamic>? pushed;
      final outcome = await state.syncWith(
        fetch: () async => remote,
        push: (data) async => pushed = data,
      );
      expect(outcome, SyncOutcome.merged);
      expect(state.totalXp, 5000);
      expect(state.examHistory.single.points, 20);
      expect(state.readTopics, contains('k2_grzyby_budowa'), reason: 'postęp z drugiego urządzenia dochodzi');
      expect(state.topicAnsweredCount(topic.id), 1, reason: 'lokalny postęp nie może zniknąć');
      expect(pushed!['topicAnswered'][topic.id], 1);
    });

    test('nothing to do when both sides are identical', () async {
      final state = await _state(DateTime(2026, 9, 19, 10));
      state.markTopicRead('k1_chemizm_bialka');
      final remote = state.exportState();
      final outcome = await state.syncWith(fetch: () async => remote, push: (_) async => fail('nie wysyłaj'));
      expect(outcome, SyncOutcome.upToDate);
    });

    test('a server error does not touch the local progress', () async {
      final state = await _state(DateTime(2026, 9, 19, 10));
      state.markTopicRead('k1_chemizm_bialka');
      final outcome = await state.syncWith(
        fetch: () async => throw Exception('brak sieci'),
        push: (_) async => fail('nie wysyłaj'),
      );
      expect(outcome, SyncOutcome.failed);
      expect(state.readTopics, contains('k1_chemizm_bialka'));
    });
  });
}
