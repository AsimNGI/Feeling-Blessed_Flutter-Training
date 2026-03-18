import 'package:flutter_training/core/domain/data_state.dart';
import 'package:flutter_training/features/home/domain/entities/request/home_request.dart';
import 'package:flutter_training/features/home/domain/entities/response/home_response.dart';

abstract class HomeContract {
  Future<DataState<HomeResponse>> getHome(HomeRequest request);
}
