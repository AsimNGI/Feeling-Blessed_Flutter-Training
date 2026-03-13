import 'package:dio/dio.dart';
import 'package:flutter_training/core/constants/api_constants.dart';

import '../core/network/dio_client.dart';
import '../model/home_data.dart';


class HomeApi {

  Future<HomeData> getHome({String? latitude, String? longitude}) async {
    final response = await DioClient().getRequest(
      ApiConstants.home,
      queryParameters: <String, String>{
        if (latitude != null && latitude.isNotEmpty) 'latitude': latitude,
        if (longitude != null && longitude.isNotEmpty) 'longitude': longitude,
      },
    );

    final body = response?.data as Map<String, dynamic>?;
    if (body == null) throw Exception('Empty response');

    final code = body['code'] as int? ?? 0;
    if (code < 200 || code >= 300) {
      throw Exception(body['message'] as String? ?? 'Request failed');
    }

    final data = body['data'];
    if (data is! Map<String, dynamic>) throw Exception('No data');

    return HomeData.fromJson(data);
  }
}
