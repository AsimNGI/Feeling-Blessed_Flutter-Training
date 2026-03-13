import 'package:flutter/material.dart';
import 'package:flutter_training/core/constants/app_colors.dart';
import 'package:flutter_training/core/constants/app_font_sizes.dart';
import 'package:flutter_training/core/constants/app_font_weights.dart';

class AppTextStyles {
  static const String _fontFamily = 'Inter';

  /// Heavy (w900) – strongest emphasis
  static TextStyle get headlineLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp24,
    fontWeight: AppFontWeights.heavy,
    color: AppColors.textPrimary,
  );

  /// Bold (w700)
  static TextStyle get headlineSmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp20,
    fontWeight: AppFontWeights.bold,
    color: AppColors.textPrimary,
  );

  /// Semi-bold (w600)
  static TextStyle get titleLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp18,
    fontWeight: AppFontWeights.semiBold,
    color: AppColors.textPrimary,
  );

  /// Extra-bold (w800)
  static TextStyle get titleMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp16,
    fontWeight: AppFontWeights.w800,
    color: AppColors.textPrimary,
  );

  /// Extra-bold (w800)
  static TextStyle get titleSmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp14,
    fontWeight: AppFontWeights.w800,
    color: AppColors.textPrimary,
  );

  static TextStyle get titleXSmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp12,
    fontWeight: AppFontWeights.w800,
    color: AppColors.textPrimary,
  );

  /// Semi-bold body
  static TextStyle get bodyLarge =>
      TextStyle(fontFamily: _fontFamily, fontSize: AppFontSizes.sp16, color: AppColors.textPrimary);
  static TextStyle get bodyMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp14,
    color: AppColors.textSecondary,
  );
  static TextStyle get bodySmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp12,
    color: AppColors.textSecondary,
  );

  /// Semi-bold (w600)
  static TextStyle get buttonSmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp14,
    fontWeight: AppFontWeights.semiBold,
  );
  static TextStyle get caption =>
      TextStyle(fontFamily: _fontFamily, fontSize: AppFontSizes.sp12, color: AppColors.textMuted);
  static TextStyle get captionUnderline => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp12,
    color: AppColors.textSecondary,
    decoration: TextDecoration.underline,
  );
  static TextStyle get overlayTitle => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp12,
    fontWeight: AppFontWeights.bold,
    color: AppColors.textOnDark,
  );
  static TextStyle get overlayCaption => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp12,
    fontWeight: AppFontWeights.bold,
    color: AppColors.textOnDark,
  );

  static TextStyle get bodyUnderline => TextStyle(
    fontFamily: _fontFamily,
    fontSize: AppFontSizes.sp16,
    color: AppColors.textPrimary,
    decoration: TextDecoration.underline,
  );
}
