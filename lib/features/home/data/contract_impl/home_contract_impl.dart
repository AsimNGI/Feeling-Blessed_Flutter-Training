import 'package:flutter_training/core/config/constants/api_constants.dart';
import 'package:flutter_training/core/data/network/dio_client.dart';
import 'package:flutter_training/core/data/network/remote.dart';
import 'package:flutter_training/core/domain/data_state.dart';
import 'package:flutter_training/features/home/data/mappers/home_mapper.dart';
import 'package:flutter_training/features/home/data/models/home_response_dto.dart';
import 'package:flutter_training/features/home/domain/contracts/home_contract.dart';
import 'package:flutter_training/features/home/domain/entities/request/home_request.dart';
import 'package:flutter_training/features/home/domain/entities/response/home_response.dart';

class HomeContractImpl implements HomeContract {
  HomeContractImpl(this._remoteDataSource);

  final IRemoteDataSource<DioClient> _remoteDataSource;

  @override
  Future<DataState<HomeResponse>> getHome(HomeRequest request) async {
    try {
      final response = await _remoteDataSource.source.getRequest(
        ApiConstants.home,
        queryParameters: <String, String>{
          if (request.latitude != null && request.latitude!.isNotEmpty)
            'latitude': request.latitude!,
          if (request.longitude != null && request.longitude!.isNotEmpty)
            'longitude': request.longitude!,
        },
      );

      final data = response?.data['data'] as Map<String, dynamic>?;
      if (data == null) {
        return Error<HomeResponse>('Invalid response: missing data');
      }
      final dto = HomeResponseDto.fromJson(data);
      return Success<HomeResponse>(HomeMapper.toDomain(dto));
    } catch (e) {
      return Error<HomeResponse>(e.toString());
    }
  }
}
