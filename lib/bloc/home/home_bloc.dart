import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/home_api.dart';
import '../../model/home_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._api) : super(const HomeInitial()) {
    on<HomeLoadRequested>(_onLoad);
  }

  final HomeApi _api;

  Future<void> _onLoad(HomeLoadRequested event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      final data = await _api.getHome();
      emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
