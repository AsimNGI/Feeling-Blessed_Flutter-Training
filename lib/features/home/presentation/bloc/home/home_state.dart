part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final HomeResponse data;
  int version = 0;
  HomeLoaded(this.data, this.version);
  @override
  List<Object?> get props => [data, version];
}

class HomeError extends HomeState {
  const HomeError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
