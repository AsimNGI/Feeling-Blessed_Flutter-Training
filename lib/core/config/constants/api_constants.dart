import 'package:flutter_training/core/config/global/env/app_env.dart';

class ApiConstants {
  static String get baseUrl {
    final url = AppEnv.apiBaseUrl;
    return url.isNotEmpty ? url : 'https://dev2.feelingblessed.org/api/v2/';
  }

  static const String home = 'home';
}
