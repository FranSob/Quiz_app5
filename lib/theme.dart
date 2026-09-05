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
  static const textMuted = Color(0xFF8A94A6);

  static const lightBg = Color(0xFFF4F6F8);
  static const lightCard = Color(0xFFFFFFFF);
  static const lightBorder = Color(0xFFE2E6EA);
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
