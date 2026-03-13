import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static final String baseUrl = dotenv.get('API_BASE_URL');
  static final String metaData = dotenv.get('META_DATA');
  static final String home = dotenv.get('HOME');
}
