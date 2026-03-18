import 'package:flutter_training/core/domain/base/base_use_case.dart';
import 'package:flutter_training/core/domain/data_state.dart';
import 'package:flutter_training/features/products/domain/contracts/products_contract.dart';
import 'package:flutter_training/features/products/domain/entities/product.dart';

class GetProductByIdUseCase extends UseCase<DataState<Product>, String> {
  GetProductByIdUseCase(this._contract);

  final ProductsContract _contract;

  @override
  Future<DataState<Product>> call(String id) => _contract.getProductById(id);
}
