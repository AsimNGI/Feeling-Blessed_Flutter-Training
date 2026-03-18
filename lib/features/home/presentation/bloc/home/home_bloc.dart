import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/core/domain/data_state.dart';
import 'package:flutter_training/features/home/domain/entities/request/home_request.dart';
import 'package:flutter_training/features/home/domain/entities/response/home_response.dart';
import 'package:flutter_training/features/home/domain/use_cases/get_home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeUseCase getHomeUseCase;

  HomeBloc(this.getHomeUseCase) : super(const HomeInitial()) {
    on<HomeLoadRequested>(_onLoad);
  }

  Future<void> _onLoad(HomeLoadRequested event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    final result = await getHomeUseCase.call(HomeRequest());
    if (result is Success<HomeResponse>) {
      emit(HomeLoaded(result.data));
    } else {
      emit(HomeError((result as Error<HomeResponse>).error ?? 'Unknown error'));
    }
  }
}
