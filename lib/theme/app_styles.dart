import 'package:flutter/material.dart';
import 'package:flutter_training/theme/app_text_styles.dart';

/// Single entry point for all text styles. Call [AppStyles.of(context)] once
/// per build, then use the getters. Theme-based styles come from the current
/// [TextTheme]; custom styles (button, caption, overlay) are from [AppTextStyles].
class AppStyles {
  AppStyles._(this._textTheme);

  final TextTheme _textTheme;

  /// Get all styles for this context. Call once at the top of build and reuse.
  static AppStyles of(BuildContext context) {
    return AppStyles._(Theme.of(context).textTheme);
  }

  // --- From Theme (TextTheme) ---
  TextStyle get headlineLarge => _textTheme.headlineLarge!;
  TextStyle get headlineSmall => _textTheme.headlineSmall!;
  TextStyle get titleLarge => _textTheme.titleLarge!;
  TextStyle get titleMedium => _textTheme.titleMedium!;
  TextStyle get titleSmall => _textTheme.titleSmall!;
  TextStyle get bodyLarge => _textTheme.bodyLarge!;
  TextStyle get bodyMedium => _textTheme.bodyMedium!;
  TextStyle get bodySmall => _textTheme.bodySmall!;

  // --- Custom (not in TextTheme) ---
  TextStyle get titleXSmall => AppTextStyles.titleXSmall;
  TextStyle get buttonSmall => AppTextStyles.buttonSmall;
  TextStyle get caption => AppTextStyles.caption;
  TextStyle get captionUnderline => AppTextStyles.captionUnderline;
  TextStyle get overlayTitle => AppTextStyles.overlayTitle;
  TextStyle get overlayCaption => AppTextStyles.overlayCaption;
  TextStyle get bodyUnderline => AppTextStyles.bodyUnderline;
}
