import 'package:flutter/material.dart';

import 'tokens.dart';

final appTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.background,
  fontFamily: AppFonts.body,
  colorScheme: ColorScheme.dark(
    surface: AppColors.card,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.accent,
    error: AppColors.destructive,
    onSurface: AppColors.foreground,
    onPrimary: AppColors.foreground,
    outline: AppColors.border,
  ),
  textTheme: const TextTheme(
    displayLarge:  TextStyle(fontFamily: AppFonts.display, fontWeight: FontWeight.w300),
    displayMedium: TextStyle(fontFamily: AppFonts.display, fontWeight: FontWeight.w400),
    displaySmall:  TextStyle(fontFamily: AppFonts.display, fontWeight: FontWeight.w500),
    headlineLarge: TextStyle(fontFamily: AppFonts.display, fontWeight: FontWeight.w600),
    headlineMedium:TextStyle(fontFamily: AppFonts.display, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(fontFamily: AppFonts.display, fontWeight: FontWeight.w700),
    bodyLarge:     TextStyle(fontFamily: AppFonts.body, fontWeight: FontWeight.w400),
    bodyMedium:    TextStyle(fontFamily: AppFonts.body, fontWeight: FontWeight.w400),
    bodySmall:     TextStyle(fontFamily: AppFonts.body, fontWeight: FontWeight.w300),
    labelLarge:    TextStyle(fontFamily: AppFonts.body, fontWeight: FontWeight.w600),
  ),
  useMaterial3: true,
);
