import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'services/cloud_sync.dart';
import 'state/app_state.dart';
import 'theme.dart';
import 'screens/root_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bez kluczy Supabase aplikacja działa dalej, tyle że bez kont.
  await CloudSync.init();
  runApp(const BioMaturaApp());
}

class BioMaturaApp extends StatefulWidget {
  const BioMaturaApp({super.key});

  @override
  State<BioMaturaApp> createState() => _BioMaturaAppState();
}

class _BioMaturaAppState extends State<BioMaturaApp> {
  final AppState _appState = AppState();

  @override
  void initState() {
    super.initState();
    _appState.load().then((_) {
      // Po starcie ściągamy postęp z chmury, jeśli uczeń jest zalogowany.
      if (CloudSync.signedIn) syncNow(_appState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>.value(
      value: _appState,
      child: Consumer<AppState>(
        builder: (context, state, _) {
          if (!state.loaded) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: buildDarkTheme(),
              home: const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          return MaterialApp(
            title: 'BioMatura',
            debugShowCheckedModeBanner: false,
            locale: const Locale('pl'),
            supportedLocales: const [Locale('pl')],
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            theme: buildLightTheme(),
            darkTheme: buildDarkTheme(),
            themeMode: state.themeMode,
            home: const RootShell(),
          );
        },
      ),
    );
  }
}
