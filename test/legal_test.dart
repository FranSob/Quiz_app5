import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:biomatura/data/legal_config.dart';
import 'package:biomatura/screens/legal_screen.dart';
import 'package:biomatura/screens/my_data_screen.dart';
import 'package:biomatura/state/app_state.dart';
import 'package:biomatura/theme.dart';

/// Treści dokumentów wczytane raz, poza testami widgetów — tam odczyt z dysku
/// nie kończy się w sztucznym czasie testu.
final Map<String, String> _texts = {};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    for (final document in legalDocuments) {
      _texts[document.asset] = await rootBundle.loadString(document.asset);
    }
  });

  test('every document is shipped with the app and is not empty', () async {
    for (final document in legalDocuments) {
      final text = await rootBundle.loadString(document.asset);
      expect(text.trim(), isNotEmpty, reason: document.asset);
      expect(text, contains('# '), reason: '${document.asset} — brak nagłówka');
    }
  });

  test('documents use only placeholders that we know how to fill', () async {
    final known = legalDetails.keys.toSet();
    for (final document in legalDocuments) {
      final text = await rootBundle.loadString(document.asset);
      // Znaczniki zapisujemy WIELKIMI literami, żeby nie mylić ich z odnośnikami.
      final found = RegExp(r'\[([A-ZŻŹĆĄŚĘŁÓŃ][A-ZŻŹĆĄŚĘŁÓŃ_0-9-]+)\]')
          .allMatches(text)
          .map((m) => m[1]!)
          .toSet();
      expect(found.difference(known), isEmpty, reason: '${document.asset} — nieznany znacznik');
    }
  });

  test('missing seller details are reported, filled ones are substituted', () {
    expect(missingLegalDetails(), isNot(contains('NAZWA_APLIKACJI')));
    expect(fillLegalPlaceholders('Aplikacja [NAZWA_APLIKACJI].'), 'Aplikacja ${legalDetails['NAZWA_APLIKACJI']}.');
    expect(fillLegalPlaceholders('Kontakt: [E-MAIL_KONTAKTOWY]'), contains('do uzupełnienia'));
  });

  testWidgets('documents render on a phone screen and warn about unfinished details', (tester) async {
    tester.view.physicalSize = const Size(400, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    for (final document in legalDocuments) {
      final text = _texts[document.asset]!;
      await tester.pumpWidget(MaterialApp(
        theme: buildDarkTheme(),
        locale: const Locale('pl'),
        supportedLocales: const [Locale('pl')],
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        home: Scaffold(body: LegalContent(text: text)),
      ));
      await tester.pumpAndSettle();
      final firstHeading = text.split('\n').first.replaceFirst('# ', '').trim();
      expect(find.text(firstHeading), findsOneWidget, reason: document.asset);
      if (missingLegalDetails().isNotEmpty) {
        expect(find.textContaining('Dokument nie jest gotowy do publikacji'), findsOneWidget);
      }
      expect(find.textContaining('[E-MAIL_KONTAKTOWY]'), findsNothing, reason: 'znacznik musi być podmieniony');
    }
  });

  testWidgets('my data screen shows the whole saved progress', (tester) async {
    tester.view.physicalSize = const Size(400, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    SharedPreferences.setMockInitialValues({});
    final state = AppState();
    await state.load();
    state.markTopicRead('k1_chemizm_bialka');

    await tester.pumpWidget(ChangeNotifierProvider<AppState>.value(
      value: state,
      child: MaterialApp(
        theme: buildDarkTheme(),
        locale: const Locale('pl'),
        supportedLocales: const [Locale('pl')],
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        home: const MyDataScreen(),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.text('Moje dane'), findsOneWidget);
    expect(find.textContaining('k1_chemizm_bialka'), findsOneWidget);
  });
}
