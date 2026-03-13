import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/di/di.dart';
import '../../../domain/entities/request/home_request.dart';
import '../../../domain/entities/response/home_response.dart';
import '../../../domain/use_case/get_home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeUseCase getHomeUseCase = sl<GetHomeUseCase>();
  HomeBloc() : super(const HomeInitial()) {
    on<HomeLoadRequested>(_onLoad);
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
}
