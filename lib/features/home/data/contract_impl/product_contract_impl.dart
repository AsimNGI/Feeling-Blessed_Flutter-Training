import 'package:flutter_training/features/home/domain/contracts/product_contract.dart';

import '../../../../core/data/network/data_state.dart';
import '../../../../core/data/network/graphql_client.dart';
import '../../../../core/data/network/remote.dart';
import '../../domain/queries/get_product_by_id_query.dart';
import '../../domain/queries/get_product_query.dart';

class ProductContractImpl extends ProductContract {
  final IRemoteDataSource<GraphQLService> remoteDataSource;

  ProductContractImpl(this.remoteDataSource);

  @override
  Future<DataState<Map<String, dynamic>?>> getProducts() async {
    try {
      final response = await remoteDataSource.source.performQuery(getProductsQuery);
      return Success<Map<String, dynamic>?>(response.data);
    } catch (e) {
      return Error<Map<String, dynamic>>(e.toString());
    }
  }

  @override
  Future<DataState<Map<String, dynamic>?>> getProductById(String id) async {
    try {
      final response = await remoteDataSource.source.performQueryWithParams(
        query: getProductByIdQuery,
        params: {'id': id},
      );
      return Success<Map<String, dynamic>?>(response.data);
    } catch (e) {
      return Error<Map<String, dynamic>>(e.toString());
    }
  }
}
