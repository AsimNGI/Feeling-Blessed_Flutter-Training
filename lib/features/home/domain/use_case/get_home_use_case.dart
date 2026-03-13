import '../../../../core/data/network/data_state.dart';
import '../../../../core/domain/base/base_use_case.dart';
import '../contracts/home_contract.dart';
import '../entities/request/home_request.dart';
import '../entities/response/home_response.dart';

class GetHomeUseCase extends UseCase<DataState<HomeResponse>, HomeRequest> {
  final HomeContract homeContract;

  GetHomeUseCase(this.homeContract);

  @override
  Future<DataState<HomeResponse>> call(HomeRequest request) async => homeContract.getHome(request);
}
