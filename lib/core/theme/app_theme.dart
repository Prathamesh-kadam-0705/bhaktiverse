// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  // Primary Saffron/Golden Palette
  static const Color saffron = Color(0xFFFF6B00);
  static const Color saffronLight = Color(0xFFFF8C42);
  static const Color saffronDark = Color(0xFFCC5500);
  static const Color golden = Color(0xFFFFD700);
  static const Color goldenLight = Color(0xFFFFE566);
  static const Color goldenDark = Color(0xFFCCAA00);

  // Background Colors
  static const Color darkBg = Color(0xFF0D0A04);
  static const Color darkSurface = Color(0xFF1A1308);
  static const Color darkCard = Color(0xFF241C0A);
  static const Color darkElevated = Color(0xFF2E2410);

  // Light Theme
  static const Color lightBg = Color(0xFFFFFDF5);
  static const Color lightSurface = Color(0xFFFFF8E8);
  static const Color lightCard = Color(0xFFFFF3D0);

  // Text Colors
  static const Color textPrimary = Color(0xFFFFF8E8);
  static const Color textSecondary = Color(0xFFCCAA77);
  static const Color textMuted = Color(0xFF886644);
  static const Color textOnLight = Color(0xFF1A0D00);

  // Accent Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color info = Color(0xFF29B6F6);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [saffron, goldenDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [darkBg, darkSurface],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF2E2410), Color(0xFF1A1308)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBg,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.saffron,
        secondary: AppColors.golden,
        surface: AppColors.darkSurface,
        background: AppColors.darkBg,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: AppColors.textOnLight,
        onSurface: AppColors.textPrimary,
        onBackground: AppColors.textPrimary,
      ),
      textTheme: _buildTextTheme(AppColors.textPrimary),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBg,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.mukta(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.golden,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        selectedItemColor: AppColors.saffron,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.saffron,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.mukta(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.golden),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBg,
      colorScheme: const ColorScheme.light(
        primary: AppColors.saffron,
        secondary: AppColors.goldenDark,
        surface: AppColors.lightSurface,
        background: AppColors.lightBg,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textOnLight,
        onBackground: AppColors.textOnLight,
      ),
      textTheme: _buildTextTheme(AppColors.textOnLight),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightBg,
        foregroundColor: AppColors.textOnLight,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.mukta(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.saffronDark,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.saffron,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shadowColor: AppColors.saffron.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.saffronDark),
    );
  }

  static TextTheme _buildTextTheme(Color baseColor) {
    return TextTheme(
      displayLarge: GoogleFonts.mukta(
        fontSize: 57, fontWeight: FontWeight.w700, color: baseColor,
      ),
      displayMedium: GoogleFonts.mukta(
        fontSize: 45, fontWeight: FontWeight.w700, color: baseColor,
      ),
      displaySmall: GoogleFonts.mukta(
        fontSize: 36, fontWeight: FontWeight.w600, color: baseColor,
      ),
      headlineLarge: GoogleFonts.mukta(
        fontSize: 32, fontWeight: FontWeight.w700, color: baseColor,
      ),
      headlineMedium: GoogleFonts.mukta(
        fontSize: 28, fontWeight: FontWeight.w600, color: baseColor,
      ),
      headlineSmall: GoogleFonts.mukta(
        fontSize: 24, fontWeight: FontWeight.w600, color: baseColor,
      ),
      titleLarge: GoogleFonts.mukta(
        fontSize: 22, fontWeight: FontWeight.w600, color: baseColor,
      ),
      titleMedium: GoogleFonts.mukta(
        fontSize: 16, fontWeight: FontWeight.w600, color: baseColor,
      ),
      titleSmall: GoogleFonts.mukta(
        fontSize: 14, fontWeight: FontWeight.w600, color: baseColor,
      ),
      bodyLarge: GoogleFonts.mukta(
        fontSize: 16, fontWeight: FontWeight.w400, color: baseColor,
      ),
      bodyMedium: GoogleFonts.mukta(
        fontSize: 14, fontWeight: FontWeight.w400, color: baseColor,
      ),
      bodySmall: GoogleFonts.mukta(
        fontSize: 12, fontWeight: FontWeight.w400, color: baseColor,
      ),
      labelLarge: GoogleFonts.mukta(
        fontSize: 14, fontWeight: FontWeight.w600, color: baseColor,
      ),
    );
  }
}