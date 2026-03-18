import 'package:flutter_training/core/domain/base/base_use_case.dart';
import 'package:flutter_training/core/domain/data_state.dart';
import 'package:flutter_training/features/home/domain/contracts/home_contract.dart';
import 'package:flutter_training/features/home/domain/entities/request/home_request.dart';
import 'package:flutter_training/features/home/domain/entities/response/home_response.dart';

class GetHomeUseCase extends UseCase<DataState<HomeResponse>, HomeRequest> {
  final HomeContract homeContract;

  GetHomeUseCase(this.homeContract);

  @override
  Future<DataState<HomeResponse>> call(HomeRequest request) async {
    return await homeContract.getHome(request);
  }
}
