import 'package:flutter_training/features/home/domain/contracts/home_contract.dart'
    show HomeContract;

import '../../../../core/constants/api_constants.dart';
import '../../../../core/data/network/data_state.dart';
import '../../../../core/data/network/dio_client.dart';
import '../../../../core/data/network/remote.dart';
import '../../domain/entities/request/home_request.dart';
import '../../domain/entities/response/home_response.dart';

class HomeContractImpl extends HomeContract {
  final IRemoteDataSource<DioClient> remoteDataSource;

  HomeContractImpl(this.remoteDataSource);

  @override
  Future<DataState<HomeResponse>> getHome(HomeRequest request) async {
    try {
      final response = await remoteDataSource.source.getRequest(
        ApiConstants.home,
        queryParameters: <String, String>{
          if (request.latitude != null && request.latitude!.isNotEmpty)
            'latitude': request.latitude!,
          if (request.longitude != null && request.longitude!.isNotEmpty)
            'longitude': request.longitude!,
        },
      );

      return Success<HomeResponse>(HomeResponse.fromJson(response?.data['data']));
    } catch (e) {
      print(e);
      return Error<HomeResponse>(e.toString());
    }
  }
}
