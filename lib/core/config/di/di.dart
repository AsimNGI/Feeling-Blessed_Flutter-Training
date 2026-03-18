import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_training/core/data/network/dio_client.dart';
import 'package:flutter_training/core/data/network/remote.dart';
import 'package:flutter_training/core/data/network/remote_data_source.dart';
import 'package:flutter_training/features/home/data/contract_impl/home_contract_impl.dart';
import 'package:flutter_training/features/home/domain/contracts/home_contract.dart';
import 'package:flutter_training/features/home/domain/use_cases/get_home_use_case.dart';
import 'package:flutter_training/features/products/data/contract_impl/products_contract_impl.dart';
import 'package:flutter_training/features/products/domain/contracts/products_contract.dart';
import 'package:flutter_training/features/products/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:flutter_training/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../data/network/graphql_client.dart';
import '../../data/network/graphql_data_source.dart';

final sl = GetIt.instance;

class AppInitializer {
  Future<void> init() async {
    await loadAppEnv();
    dataSources();
    contracts();
    useCases();
  }

  void dataSources() {
    sl.registerLazySingleton<DioClient>(() => DioClient());
    sl.registerLazySingleton<GraphQLService>(() => GraphQLService());
    sl.registerLazySingleton<IRemoteDataSource<GraphQLService>>(() => GraphQLDataSource(sl()));
    sl.registerLazySingleton<IRemoteDataSource<DioClient>>(
      () => RemoteDataSource(sl()),
    );
    sl.get<IRemoteDataSource<DioClient>>().source.initialize();
  }

  void contracts() {
    sl.registerLazySingleton<HomeContract>(
      () => HomeContractImpl(sl()),
    );
    sl.registerLazySingleton<ProductsContract>(
      () => ProductsContractImpl(sl<IRemoteDataSource<GraphQLService>>()),
    );
  }

  void useCases() {
    sl.registerLazySingleton<GetHomeUseCase>(
      () => GetHomeUseCase(sl<HomeContract>()),
    );
    sl.registerLazySingleton<GetProductsUseCase>(
      () => GetProductsUseCase(sl<ProductsContract>()),
    );
    sl.registerLazySingleton<GetProductByIdUseCase>(
      () => GetProductByIdUseCase(sl<ProductsContract>()),
    );
  }

  Future<void> loadAppEnv() async {
    const env = String.fromEnvironment('FLUTTER_ENV', defaultValue: 'dev');
    await dotenv.load(fileName: '.env.$env');
  }
}
