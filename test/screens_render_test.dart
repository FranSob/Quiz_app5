import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:biomatura/data/biology_data.dart';
import 'package:biomatura/data/data_tasks.dart';
import 'package:biomatura/models.dart';
import 'package:biomatura/screens/data_task_screen.dart';
import 'package:biomatura/screens/data_tasks_screen.dart';
import 'package:biomatura/screens/gaps_screen.dart';
import 'package:biomatura/screens/home_screen.dart';
import 'package:biomatura/screens/premium_screen.dart';
import 'package:biomatura/screens/quiz_screen.dart';
import 'package:biomatura/screens/school_test_screen.dart';
import 'package:biomatura/screens/stats_screen.dart';
import 'package:biomatura/screens/study_plan_screen.dart';
import 'package:biomatura/state/app_state.dart';
import 'package:biomatura/theme.dart';

/// Stan ucznia z datą matury, luką, przeczytanymi tematami i zaplanowanym
/// sprawdzianem — tak, żeby na ekranach pojawiły się wszystkie nowe karty.
Future<AppState> _seededState() async {
  SharedPreferences.setMockInitialValues({});
  final state = AppState();
  await state.load();
  state.clock = () => DateTime(2026, 9, 15, 10);
  state.setExamDate(DateTime(2027, 5, 10));
  final topic = findTopicById('k4_ewolucja_populacje')!;
  for (var i = 0; i < 4; i++) {
    state.recordTestAnswer(
      topicId: topic.id,
      chapterId: chapterOfTopic(topic.id)!.id,
      questionId: topic.questions[i].id,
      correct: i == 3,
    );
  }
  state.markTopicRead('k1_metabolizm_enzymy');
  state.addPlannedTest(date: DateTime(2026, 9, 18), classLevel: 4, chapterIds: ['k4_ekologia']);
  return state;
}

Widget _app(AppState state, Widget home) => ChangeNotifierProvider<AppState>.value(
      value: state,
      child: MaterialApp(
        theme: buildDarkTheme(),
        locale: const Locale('pl'),
        supportedLocales: const [Locale('pl')],
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        home: home,
      ),
    );

void _phone(WidgetTester tester, {double height = 900}) {
  tester.view.physicalSize = Size(400, height);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

void main() {
  testWidgets('home shows plan, planned test and gap cards', (tester) async {
    _phone(tester, height: 2200);
    final state = await _seededState();
    await tester.pumpWidget(_app(state, const Scaffold(body: HomeScreen())));
    await tester.pumpAndSettle();
    expect(find.text('PLAN NAUKI'), findsOneWidget);
    expect(find.textContaining('do matury'), findsOneWidget);
    expect(find.text('SPRAWDZIAN ZA 3 DNI'), findsOneWidget);
    expect(find.text('TWOJA NAJWIĘKSZA LUKA'), findsOneWidget);
    expect(find.text('Genetyka populacji i prawo Hardy\'ego–Weinberga'), findsOneWidget);
    expect(find.text('Zadania otwarte'), findsOneWidget);
    expect(find.text('Próbna matura'), findsOneWidget);
  });

  testWidgets('study plan screen', (tester) async {
    _phone(tester, height: 1600);
    final state = await _seededState();
    await tester.pumpWidget(_app(state, const StudyPlanScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Matura: 10 maja 2027'), findsOneWidget);
    expect(find.text('Powtórz 30 fiszek'), findsOneWidget);
    expect(find.textContaining('Zadanie z danymi: Wpływ temperatury'), findsOneWidget);
    expect(find.textContaining('Zadanie otwarte: '), findsOneWidget);
  });

  testWidgets('stats, gaps, premium and data task list render', (tester) async {
    _phone(tester, height: 2000);
    final state = await _seededState();
    for (final screen in <Widget>[
      const Scaffold(body: StatsScreen()),
      const GapsScreen(),
      const PremiumScreen(),
      const DataTasksScreen(),
    ]) {
      await tester.pumpWidget(_app(state, screen));
      await tester.pumpAndSettle();
    }
    expect(find.text('Analiza rodowodu'), findsOneWidget);
  });

  testWidgets('school test setup loads the planned test', (tester) async {
    _phone(tester, height: 1600);
    final state = await _seededState();
    await tester.pumpWidget(_app(state, SchoolTestScreen(initialTest: state.upcomingPlannedTests.first)));
    await tester.pumpAndSettle();
    expect(find.text('18 września 2026 · za 3 dni'), findsOneWidget);
    final ecology = tester.widget<CheckboxListTile>(find.widgetWithText(CheckboxListTile, 'Ekologia'));
    expect(ecology.value, isTrue);
  });

  testWidgets('every data task renders on a phone screen', (tester) async {
    _phone(tester, height: 4000);
    final state = await _seededState();
    for (final task in dataTasks) {
      await tester.pumpWidget(_app(state, DataTaskScreen(task: task)));
      await tester.pumpAndSettle();
      expect(find.text(task.caption), findsOneWidget, reason: task.id);
    }
  });

  testWidgets('answering a data task records the best score', (tester) async {
    _phone(tester, height: 4000);
    final state = await _seededState();
    final task = dataTaskById('dt_k2_kielkowanie')!;
    await tester.pumpWidget(_app(state, Builder(
      builder: (context) => Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DataTaskScreen(task: task))),
            child: const Text('Otwórz'),
          ),
        ),
      ),
    )));
    await tester.tap(find.text('Otwórz'));
    await tester.pumpAndSettle();
    for (final q in task.questions) {
      await tester.tap(find.text(q.options[q.correctIndex]));
      await tester.pumpAndSettle();
    }
    expect(find.text('Wynik: 3 / 3 poprawnych odpowiedzi'), findsOneWidget);
    await tester.tap(find.text('Zakończ zadanie'));
    await tester.pumpAndSettle();
    expect(state.dataTaskBest[task.id], 3);
    expect(state.todayStat.dataTasks, 1);
  });

  testWidgets('school test result shows a grade and topic breakdown', (tester) async {
    _phone(tester);
    final state = await _seededState();
    final topic = findTopicById('k1_chemizm_bialka')!;
    final question = topic.questions.first;
    await tester.pumpWidget(_app(
      state,
      QuizScreen(
        title: 'Sprawdzian',
        items: [QuizItem(question: question, topicId: topic.id)],
        showSchoolGrade: true,
      ),
    ));
    await tester.tap(find.text(question.options[question.correctIndex]));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Zakończ test'));
    await tester.pumpAndSettle();
    expect(find.text('Orientacyjna ocena: 6 (celujący)'), findsOneWidget);
    expect(find.text('WYNIK W TEMATACH'), findsOneWidget);
    expect(find.text(topic.name), findsOneWidget);
    expect(state.topicAnsweredCount(topic.id), 1);
  });
}
