import 'package:dio/dio.dart';

import '../env/app_env.dart';

/// Simple Dio instance – base URL from env, logging.
/// See https://pub.dev/packages/dio
Dio createDio({String? baseUrl, String? authToken}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl ?? AppEnv.apiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: <String, dynamic>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        if (authToken != null && authToken.isNotEmpty)
          'Authorization': 'Bearer $authToken',
      },
    ),
  );
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ),
  );
  return dio;
}
