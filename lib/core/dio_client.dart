import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_training/utils/app_logger.dart';

import '../utils/app_constant.dart';
import 'constants/api_constants.dart';

class DioClient {
  static final Dio _dio = Dio();
  String? _encryptedKeyHeaderValue;
  String? _encryptedKeyHeaderName;

  void initialize() {
    final appVersion = AppConstants.platform == 'android' ? '10.5' : '1.0';

    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 20);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.headers = {
      "Content-Type": "application/json",
      'source': AppConstants.platform,
      'app-version': appVersion,
      "X-ENCRYPTED-KEY":
          'hNBoOenyJWDrFhd5vD81LuDAeDV4VK00he3zKEhkO/jPaENsILZPa0Odx+Ev6dzzKAORZqObdUajxWgO9i//J3mHgj7fhUWu8BxPu3S9A+BFgtDMp7t8rMvBQN7i6PXPRayamdAH31lSW/k0Yq3iBclhVI5L+Ek/4EMsPAPWKFvzzly6G8J36K2rwryu1FqZAWzw0WHv7vs9nAarqXt8fOSzmT4sTyAjBWGIqWsjbdVzSqbwqJ3PvhQiMvWfGpu9moT69gq4DTE4B2Bk6bfRFnyN6CmvEIuaTx4q5TxCtloQZ6AmI1VO7hXRLroVINfmPlCkq5Ze4lbQ6sPPCu47hQ==',
    };

    // if (AppFunctions.isStaging()) {
    //   _dio.interceptors.add(ChuckerDioInterceptor());
    // }

    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
    _dio.interceptors.add(NetworkErrorInterceptor());
    _dio.interceptors.add(AppInterceptors(this));
  }

  Dio get getDio => _dio;

  void setEncryptedKeyHeader(String? headerName, String? value) {
    _encryptedKeyHeaderName = headerName;
    _encryptedKeyHeaderValue = value;
  }

  String? get encryptedKeyHeaderName => _encryptedKeyHeaderName;
  String? get encryptedKeyHeaderValue => _encryptedKeyHeaderValue;
  //https://dev2.feelingblessed.org/api/v2/meta
  Future<Response?> getRequest(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return response;
    } on DioException catch (e) {
      AppLogger.appLog("GET ERROR: ${e.message}");
      rethrow;
    }
  }

  Future<Response?> postRequest(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return response;
    } on DioException catch (e) {
      AppLogger.appLog("POST ERROR: ${e.message}");
      rethrow;
    }
  }
}

class NetworkErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.error is SocketException) {
      AppLogger.appLog("🌐 No internet connection!");

      err = DioException(
        requestOptions: err.requestOptions,
        type: DioExceptionType.connectionError,
        error: 'No internet connection',
        message: 'Please check your internet connection.',
      );
    }

    handler.reject(err);
  }
}

class AppInterceptors extends Interceptor {
  final DioClient _dioClient;

  AppInterceptors(this._dioClient);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // AppLogger.appLog('REQUEST[${options.method}] => PATH: ${options.path}');
    // AppLogger.appLog('REQUEST[${options.method}] => PATH: ${options.path}');
    // AppLogger.appLog('QUERY[${options.queryParameters}] => PATH: ${options.path}');
    // AppLogger.appLog('QUERY[${options.queryParameters}] => PATH: ${options.path}');
    // AppLogger.appLog('BODY[${options.data}] => PATH: ${options.path}');

    // String? token = LocalCache.currentUser?.accessToken;
    // AppLogger.appPrint("access token is $token");
    // AppLogger.appLog('HEADERS[${options.headers}]');
    // if ((token.isNotEmpty)) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    // Add encrypted key header if available
    final headerName = _dioClient.encryptedKeyHeaderName;
    final encryptedKey = _dioClient.encryptedKeyHeaderValue;
    if (headerName != null && encryptedKey != null) {
      options.headers[headerName] = encryptedKey;
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // AppLogger.appLog('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    // AppLogger.appLog('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // AppLogger.appLog('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    // AppLogger.appLog('Error[${err.response?.statusCode}] => DATA: ${err.response?.data}');
    return super.onError(err, handler);
  }
}
