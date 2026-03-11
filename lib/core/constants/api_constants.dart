import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static final String baseUrl = dotenv.get('BASE_URL');
  static final String login = dotenv.get('LOGIN');
  static final String metaData = dotenv.get('META_DATA');
  static final String signup = dotenv.get('SIGNUP');
  static final String forgetPassword = dotenv.get('FORGET_PASSWORD');
  static final String appleSignup = dotenv.get('APPLE_SIGNUP');
  static final String googleSignup = dotenv.get('GOOGLE_SIGNUP');
  static final String home = dotenv.get('HOME');
  static final String userPreference = dotenv.get('USER_PREFERENCE');
}
