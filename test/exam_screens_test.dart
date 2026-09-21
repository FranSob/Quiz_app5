import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:biomatura/data/open_questions.dart';
import 'package:biomatura/logic/mock_exam.dart';
import 'package:biomatura/screens/exam_screen.dart';
import 'package:biomatura/screens/exam_setup_screen.dart';
import 'package:biomatura/screens/open_question_screen.dart';
import 'package:biomatura/screens/open_questions_screen.dart';
import 'package:biomatura/screens/premium_screen.dart';
import 'package:biomatura/screens/readiness_screen.dart';
import 'package:biomatura/screens/stats_screen.dart';
import 'package:biomatura/state/app_state.dart';
import 'package:biomatura/theme.dart';

Future<AppState> _state({bool premium = false}) async {
  SharedPreferences.setMockInitialValues({});
  final state = AppState();
  await state.load();
  state.clock = () => DateTime(2026, 9, 15, 10);
  if (premium) state.setPremium(true);
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

/// Ekran otwierany przyciskiem, żeby dało się sprawdzić powrót.
Widget _launcher(Widget screen) => Builder(
      builder: (context) => Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen)),
            child: const Text('Otwórz'),
          ),
        ),
      ),
    );

void _phone(WidgetTester tester, {double height = 1400}) {
  tester.view.physicalSize = Size(400, height);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

/// Krótkie pompowanie zamiast pumpAndSettle — arkusz ma tykający zegar.
Future<void> _settle(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
}

void main() {
  testWidgets('open question: answer, check with the key and save the score', (tester) async {
    _phone(tester, height: 2400);
    final state = await _state();
    final q = openQuestionById('oq_k1_denaturacja')!;
    await tester.pumpWidget(_app(state, _launcher(OpenQuestionScreen(question: q))));
    await tester.tap(find.text('Otwórz'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Zmienia się struktura przestrzenna enzymu.');
    await tester.tap(find.text('Sprawdź z kluczem'));
    await tester.pumpAndSettle();
    expect(find.text(q.modelAnswer), findsOneWidget);
    expect(find.text('Wynik: 0 / 2 pkt'), findsOneWidget);
    await tester.tap(find.text(q.criteria.first.text));
    await tester.pumpAndSettle();
    expect(find.text('Wynik: 1 / 2 pkt'), findsOneWidget);
    await tester.ensureVisible(find.text('Zapisz wynik'));
    await tester.tap(find.text('Zapisz wynik'));
    await tester.pumpAndSettle();
    expect(find.text('Otwórz'), findsOneWidget);
    expect(state.openBest[q.id], 1);
    expect(state.todayStat.openAnswers, 1);
  });

  testWidgets('every open question renders and the list filters by class', (tester) async {
    _phone(tester, height: 2400);
    final state = await _state();
    for (final q in openQuestions) {
      await tester.pumpWidget(_app(state, OpenQuestionScreen(question: q)));
      await tester.pump();
      expect(find.text(q.prompt), findsOneWidget, reason: q.id);
    }
    await tester.pumpWidget(_app(state, const OpenQuestionsScreen()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Kl. 1'));
    await tester.pumpAndSettle();
    expect(find.text(openQuestionById('oq_k1_woda')!.prompt), findsOneWidget);
  });

  testWidgets('premium features are locked without Premium and open with it', (tester) async {
    _phone(tester, height: 3000);
    final state = await _state();

    await tester.pumpWidget(_app(state, const ExamSetupScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Odblokuj w Premium'), findsOneWidget);
    expect(find.textContaining('Rozpocznij'), findsNothing);

    await tester.pumpWidget(_app(state, const ReadinessScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Odblokuj w Premium'), findsOneWidget);
    expect(find.text('gotowości do matury'), findsNothing);

    await tester.pumpWidget(_app(state, const Scaffold(body: StatsScreen())));
    await tester.pumpAndSettle();
    expect(find.text('Odblokuj w Premium'), findsOneWidget);

    await tester.pumpWidget(_app(state, const PremiumScreen()));
    await tester.pumpAndSettle();
    // Tabela ma opisywać tylko funkcje, które naprawdę są w aplikacji.
    expect(find.textContaining('AI-tutor'), findsNothing);
    expect(find.textContaining('Pełne arkusze maturalne'), findsNothing);
    expect(find.text('Próbna matura z timerem'), findsOneWidget);
    expect(find.text('Ocenianie odpowiedzi przez AI'), findsOneWidget);

    state.setPremium(true);
    state.readinessHistory
      ..['2026-09-13'] = 5
      ..['2026-09-14'] = 12;

    await tester.pumpWidget(_app(state, const ExamSetupScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Rozpocznij: Mini-matura'), findsOneWidget);
    expect(find.text('Rozpocznij: Próbna matura'), findsOneWidget);

    await tester.pumpWidget(_app(state, const ReadinessScreen()));
    await tester.pumpAndSettle();
    expect(find.text('gotowości do matury'), findsOneWidget);
    expect(find.text('13.09'), findsOneWidget);
    expect(find.text('Klasy'), findsOneWidget);

    await tester.pumpWidget(_app(state, const Scaffold(body: StatsScreen())));
    await tester.pumpAndSettle();
    expect(find.text('Gotowość do matury'), findsOneWidget);
    expect(find.text('Odblokuj w Premium'), findsNothing);
  });

  testWidgets('mock exam hides answers until the end and saves the result', (tester) async {
    _phone(tester);
    final state = await _state(premium: true);
    final items = buildExam(ExamVariant.mini, Random(7));
    final first = items.first as ClosedExamItem;
    final now = DateTime(2026, 9, 15, 10);
    await tester.pumpWidget(_app(state, _launcher(ExamScreen(variant: ExamVariant.mini, items: items, now: () => now))));
    await tester.tap(find.text('Otwórz'));
    await _settle(tester);
    expect(find.text('Zadanie 1 z ${items.length}'), findsOneWidget);
    expect(find.text('1:00:00'), findsOneWidget);

    await tester.tap(find.text(first.options[first.correctIndex]));
    await tester.pump();
    expect(find.text('Odpowiedzi: 1 / ${items.length}'), findsOneWidget);
    expect(find.textContaining(first.question.explanation), findsNothing);

    await tester.tap(find.byTooltip('Spis zadań'));
    await _settle(tester);
    await tester.tap(find.text('Zakończ arkusz'));
    await _settle(tester);
    await tester.tap(find.text('Zakończ'));
    await _settle(tester);

    final max = examMaxPoints(items);
    expect(find.text('1 / $max pkt'), findsOneWidget);
    final record = state.examHistory.single;
    expect(record.points, 1);
    expect(record.maxPoints, max);
    expect(record.variant, 'mini');
    expect(state.topicAnsweredCount(first.topicId), greaterThanOrEqualTo(1));

    await tester.scrollUntilVisible(find.text('Zakończ'), 400, scrollable: find.byType(Scrollable).first);
    await tester.tap(find.text('Zakończ'));
    await _settle(tester);
    expect(find.text('Otwórz'), findsOneWidget);
  });

  testWidgets('mock exam closes itself when the time is up', (tester) async {
    _phone(tester);
    final state = await _state(premium: true);
    var now = DateTime(2026, 9, 15, 10);
    final items = buildExam(ExamVariant.mini, Random(11));
    final openIndex = items.indexWhere((i) => i is OpenExamItem);
    final open = (items[openIndex] as OpenExamItem).question;
    await tester.pumpWidget(_app(state, ExamScreen(variant: ExamVariant.mini, items: items, now: () => now)));
    await tester.pump();

    await tester.tap(find.byTooltip('Spis zadań'));
    await _settle(tester);
    await tester.tap(find.text('${openIndex + 1}'));
    await _settle(tester);
    await tester.enterText(find.byType(TextField), 'Moja odpowiedź');

    now = now.add(const Duration(minutes: 59, seconds: 58));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('00:02'), findsOneWidget);

    now = now.add(const Duration(minutes: 5));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump();
    expect(find.text('Koniec czasu — arkusz został zamknięty.'), findsOneWidget);
    expect(find.text('Moja odpowiedź'), findsOneWidget);

    await tester.tap(find.text(open.criteria.first.text));
    await tester.pump();
    await tester.scrollUntilVisible(find.text('Pokaż wynik'), 400, scrollable: find.byType(Scrollable).first);
    await tester.tap(find.text('Pokaż wynik'));
    await tester.pump();

    expect(find.text('Arkusz zakończył się automatycznie po upływie czasu.'), findsOneWidget);
    final record = state.examHistory.single;
    expect(record.seconds, 3600);
    expect(record.points, open.criteria.first.points);
    expect(state.openBest[open.id], open.criteria.first.points);
  });

  testWidgets('every item of a full sheet renders on a phone screen', (tester) async {
    _phone(tester, height: 3000);
    final state = await _state(premium: true);
    final items = buildExam(ExamVariant.full, Random(1));
    await tester.pumpWidget(_app(state, ExamScreen(variant: ExamVariant.full, items: items, now: () => DateTime(2026))));
    await tester.pump();
    for (var i = 0; i < items.length - 1; i++) {
      expect(find.text('Zadanie ${i + 1} z ${items.length}'), findsOneWidget);
      await tester.tap(find.text('Następne'));
      await tester.pump();
    }
    expect(find.text('Zakończ'), findsOneWidget);
  });
}
