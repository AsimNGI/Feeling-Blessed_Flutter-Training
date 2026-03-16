import '../../../../core/data/network/data_state.dart';

abstract class ProductContract {
  Future<DataState<Map<String, dynamic>?>> getProducts();
  Future<DataState<Map<String, dynamic>?>> getProductById(String id);
}
