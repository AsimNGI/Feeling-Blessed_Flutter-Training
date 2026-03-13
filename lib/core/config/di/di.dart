import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../../../features/home/data/contract_impl/home_contract_impl.dart';
import '../../../features/home/domain/contracts/home_contract.dart';
import '../../../features/home/domain/use_case/get_home_use_case.dart';
import '../../data/network/dio_client.dart';
import '../../data/network/remote.dart';
import '../../data/network/remote_data_source.dart';

final sl = GetIt.instance;

class AppInitializer {
  Future<void> init() async {
    await loadAppEnv();
    dataSources();
    contracts();
    useCases();
  }

  dataSources() {
    sl.registerLazySingleton<DioClient>(() => DioClient());
    sl.registerLazySingleton<IRemoteDataSource<DioClient>>(() => RemoteDataSource(sl()));
    sl.get<IRemoteDataSource<DioClient>>().source.initialize();
  }

  useCases() {
    sl.registerLazySingleton<GetHomeUseCase>(() => GetHomeUseCase(sl()));
  }

  contracts() {
    sl.registerLazySingleton<HomeContract>(() => HomeContractImpl(sl()));
  }

  Future<void> loadAppEnv() async {
    const env = String.fromEnvironment('FLUTTER_ENV', defaultValue: 'dev');
    await dotenv.load(fileName: '.env.$env');
  }
}
