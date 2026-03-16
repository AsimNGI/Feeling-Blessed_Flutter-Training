import '../../../../core/data/network/data_state.dart';
import '../../../../core/domain/base/base_use_case.dart';
import '../contracts/product_contract.dart';

class GetProductUseCase extends NoParamsUseCase<DataState<Map<String, dynamic>?>> {
  final ProductContract productContract;

  GetProductUseCase(this.productContract);

  @override
  Future<DataState<Map<String, dynamic>?>> call() async => productContract.getProducts();
}
