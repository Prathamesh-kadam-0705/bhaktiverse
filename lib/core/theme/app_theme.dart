import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {

  AppTheme._();

  static ThemeData lightTheme =
  ThemeData(

    useMaterial3: true,

    scaffoldBackgroundColor:
    AppColors.background,

    colorScheme:
    ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),

    appBarTheme:
    const AppBarTheme(
      centerTitle: true,
      backgroundColor:
      AppColors.background,
      elevation: 0,
    ),

    cardColor:
    AppColors.card,
  );
}