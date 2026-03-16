import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/di/di.dart';
import '../../../domain/entities/request/home_request.dart';
import '../../../domain/entities/response/home_response.dart';
import '../../../domain/use_case/get_home_use_case.dart';
import '../../../domain/use_case/get_product_by_id_use_case.dart';
import '../../../domain/use_case/get_product_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeUseCase getHomeUseCase = sl<GetHomeUseCase>();
  final GetProductUseCase getProductUseCase = sl<GetProductUseCase>();
  final GetProductByIdUseCase getProductByIdUseCase = sl<GetProductByIdUseCase>();

  HomeBloc() : super(const HomeInitial()) {
    on<HomeLoadRequested>(_onLoad);
    on<ProductLoadRequested>(_onProductLoad);
    on<ProductByIdLoadRequested>(_onProductByIdLoad);
  }

  Future<void> _onLoad(HomeLoadRequested event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      final homeResponse = await getHomeUseCase.call(
        HomeRequest(latitude: '37.774929', longitude: '-122.419416'),
      );
      print("homeResponse.data?.banner: ${homeResponse.data?.banner}");
      emit(HomeLoaded(homeResponse.data!));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onProductLoad(ProductLoadRequested event, Emitter<HomeState> emit) async {
    print("onProductLoad");
    try {
      final productResponse = await getProductUseCase.call();
      print("productResponse.data: ${productResponse.data}");
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onProductByIdLoad(ProductByIdLoadRequested event, Emitter<HomeState> emit) async {
    print("onProductByIdLoad");
    try {
      final productResponse = await getProductByIdUseCase.call(event.id);
      print("productByIdResponse.data: ${productResponse.data}");
    } catch (e) {
      print(e);
    }
  }
}
