import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/app_state.dart';
import 'theme.dart';
import 'screens/root_shell.dart';

void main() {
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
    _appState.load();
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
