import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment config loaded from .env.dev / .env.staging / .env.production.
/// Values mirror [android-2025/presentation/build.gradle.kts] product flavors.
/// Call [loadAppEnv] from main() before runApp().
class AppEnv {
  AppEnv._();

  static String get env =>
      dotenv.maybeGet('FLUTTER_ENV', fallback: 'dev') ?? 'dev';

  static String get apiBaseUrl =>
      dotenv.maybeGet('API_BASE_URL', fallback: '') ?? '';

  static String get webUrl => dotenv.maybeGet('WEB_URL', fallback: '') ?? '';

  static String get appName =>
      dotenv.maybeGet('APP_NAME', fallback: 'Feeling Blessed') ?? 'Feeling Blessed';

  static String get applicationId =>
      dotenv.maybeGet('APPLICATION_ID', fallback: '') ?? '';

  static String get accountType =>
      dotenv.maybeGet('ACCOUNT_TYPE', fallback: '') ?? '';

  static String get authority =>
      dotenv.maybeGet('AUTHORITY', fallback: '') ?? '';

  static String get facebookAppId =>
      dotenv.maybeGet('FACEBOOK_APP_ID', fallback: '') ?? '';

  static String get googleKey =>
      dotenv.maybeGet('GOOGLE_KEY', fallback: '') ?? '';

  static String get mixpanelProjectToken =>
      dotenv.maybeGet('MIXPANEL_PROJECT_TOKEN', fallback: '') ?? '';

  static String get stripePublishableKey =>
      dotenv.maybeGet('STRIPE_PUBLISHABLE_KEY', fallback: '') ?? '';

  static String get versionName =>
      dotenv.maybeGet('VERSION_NAME', fallback: '1.0.0') ?? '1.0.0';

  static int get versionCode =>
      int.tryParse(dotenv.maybeGet('VERSION_CODE', fallback: '1') ?? '1') ?? 1;

  static bool get isDev => env == 'dev';
  static bool get isStaging => env == 'staging';
  static bool get isProduction => env == 'production';
}

/// Load the env file for the current [FLUTTER_ENV] (set via --dart-define=FLUTTER_ENV=dev|staging|production).
/// Call this in main() before runApp().

