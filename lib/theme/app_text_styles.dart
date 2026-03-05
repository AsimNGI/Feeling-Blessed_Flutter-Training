import 'package:flutter/material.dart';
import 'package:flutter_training/utils/app_colors.dart';
import 'package:flutter_training/utils/app_font_sizes.dart';
import 'package:flutter_training/utils/app_font_weights.dart';


class AppTextStyles {
  static TextStyle get headlineLarge => TextStyle(
        fontSize: AppFontSizes.sp24,
        fontWeight: AppFontWeights.bold,
        color: AppColors.textPrimary,
      );
  static TextStyle get headlineSmall => TextStyle(
        fontSize: AppFontSizes.sp20,
        fontWeight: AppFontWeights.bold,
        color: AppColors.textPrimary,
      );
  static TextStyle get titleLarge => TextStyle(
        fontSize: AppFontSizes.sp18,
        fontWeight: AppFontWeights.w600,
        color: AppColors.textPrimary,
      );
  static TextStyle get titleMedium => TextStyle(
        fontSize: AppFontSizes.sp16,
        fontWeight: AppFontWeights.w600,
        color: AppColors.textPrimary,
      );
  static TextStyle get bodyLarge => TextStyle(
        fontSize: AppFontSizes.sp16,
        color: AppColors.textPrimary,
      );
  static TextStyle get bodyMedium => TextStyle(
        fontSize: AppFontSizes.sp14,
        color: AppColors.textSecondary,
      );
  static TextStyle get bodySmall => TextStyle(
        fontSize: AppFontSizes.sp12,
        color: AppColors.textSecondary,
      );
  static TextStyle get caption => TextStyle(
        fontSize: AppFontSizes.sp12,
        color: AppColors.textMuted,
      );
  static TextStyle get captionUnderline => TextStyle(
        fontSize: AppFontSizes.sp12,
        color: AppColors.textSecondary,
        decoration: TextDecoration.underline,
      );
  static TextStyle get overlayTitle => TextStyle(
        fontSize: AppFontSizes.sp12,
        fontWeight: AppFontWeights.bold,
        color: AppColors.textOnDark,
      );
  static TextStyle get overlayCaption => TextStyle(
        fontSize: AppFontSizes.sp12,
        fontWeight: AppFontWeights.bold,
        color: AppColors.textOnDark,
      );
}
