import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {

  AppTextStyles._();

  static const heading =
  TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const title =
  TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const subtitle =
  TextStyle(
    fontSize: 15,
    color: AppColors.textSecondary,
  );

  static const button =
  TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
}