import '../../../../core/data/network/data_state.dart';
import '../entities/request/home_request.dart';
import '../entities/response/home_response.dart';

abstract class HomeContract {
  Future<DataState<HomeResponse>> getHome(HomeRequest request);
}
