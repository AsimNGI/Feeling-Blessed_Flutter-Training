import 'dart:io';

class AppConstants {
  static const double designWidth = 402;
  static const double designHeight = 874;

  /// Splash screen logo size (match native splash for seamless transition).
  static const double splashLogoSize = 120;
  static String platform = Platform.isAndroid ? 'android' : 'ios';
}
