import '../../../../core/data/network/data_state.dart';
import '../../../../core/domain/base/base_use_case.dart';
import '../contracts/product_contract.dart';

class GetProductByIdUseCase extends UseCase<DataState<Map<String, dynamic>?>, String> {
  final ProductContract productContract;

  GetProductByIdUseCase(this.productContract);

  @override
  Future<DataState<Map<String, dynamic>?>> call(String id) async =>
      productContract.getProductById(id);
}
