import 'package:flutter_training/core/domain/data_state.dart';
import 'package:flutter_training/features/products/domain/entities/product.dart';

abstract class ProductsContract {
  Future<DataState<List<Product>>> getProducts();
  Future<DataState<Product>> getProductById(String id);
}
