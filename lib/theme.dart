import 'package:flutter/material.dart';

class AppColors {
  static const darkBg = Color(0xFF0A0E14);
  static const darkCard = Color(0xFF11171F);
  static const darkCardAlt = Color(0xFF161D27);
  static const darkBorder = Color(0xFF232B37);
  static const green = Color(0xFF3ECF8E);
  static const greenDark = Color(0xFF1F5C43);
  static const greenBanner = Color(0xFF163D2C);
  static const orange = Color(0xFFF5A623);
  static const red = Color(0xFFEF5350);
  static const textMuted = Color(0xFF6F7A8C);

  static const lightBg = Color(0xFFF4F6F8);
  static const lightCard = Color(0xFFFFFFFF);
  static const lightBorder = Color(0xFFE2E6EA);

  /// Jaśniejsze odpowiedniki ciemnych tafli — w trybie jasnym ciemne kafelki
  /// i paski postępu wyglądały jak dziury w interfejsie.
  static const lightCardAlt = Color(0xFFEDF1F6);
  static const lightTrack = Color(0xFFD8DEE6);

  /// Zieleń na jasnym tle musi być ciemniejsza, żeby tekst dało się czytać.
  static const greenOnLight = Color(0xFF177A54);
  static const greenSoftLight = Color(0xFFE2F6EC);
}

/// Kolory zależne od motywu. Dzięki temu ekrany nie powtarzają w kółko
/// warunku „jeśli ciemny motyw, to…".
extension AppThemeColors on BuildContext {
  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;

  /// Tło karty.
  Color get appCard => isDarkTheme ? AppColors.darkCard : AppColors.lightCard;

  /// Tło elementu wewnątrz karty (kafelek odpowiedzi, odznaka, przycisk ikony).
  Color get appCardAlt => isDarkTheme ? AppColors.darkCardAlt : AppColors.lightCardAlt;

  Color get appBorder => isDarkTheme ? AppColors.darkBorder : AppColors.lightBorder;

  /// Niewypełniona część paska postępu.
  Color get appTrack => isDarkTheme ? AppColors.darkBorder : AppColors.lightTrack;

  /// Zielony tekst i ikony na tle karty.
  Color get appGreenText => isDarkTheme ? AppColors.green : AppColors.greenOnLight;

  /// Delikatne zielone tło pod wyróżnionym paskiem.
  Color get appGreenSoft =>
      isDarkTheme ? AppColors.greenDark.withValues(alpha: 0.35) : AppColors.greenSoftLight;
}

ThemeData buildDarkTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.darkBg,
    colorScheme: base.colorScheme.copyWith(
      surface: AppColors.darkBg,
      primary: AppColors.green,
      secondary: AppColors.orange,
    ),
    cardColor: AppColors.darkCard,
    dividerColor: AppColors.darkBorder,
    textTheme: base.textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBg,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}

ThemeData buildLightTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.lightBg,
    colorScheme: base.colorScheme.copyWith(
      surface: AppColors.lightBg,
      primary: AppColors.green,
      secondary: AppColors.orange,
    ),
    cardColor: AppColors.lightCard,
    dividerColor: AppColors.lightBorder,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBg,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
  );
}
