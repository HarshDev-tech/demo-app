import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red,
      surface: Colors.white,
      onSurface: AppColors.neutral5,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: AppColors.neutral5),
      titleTextStyle: TextStyle(color: AppColors.neutral1),
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.redAccent,
      surface: AppColors.neutral4,
      onSurface: Colors.white,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.neutral4,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    scaffoldBackgroundColor: AppColors.neutral5,
    textTheme: const TextTheme(),
  );
}
