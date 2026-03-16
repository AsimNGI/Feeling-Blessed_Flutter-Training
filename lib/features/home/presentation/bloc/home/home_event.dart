part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class HomeLoadRequested extends HomeEvent {
  const HomeLoadRequested();
}

class ProductLoadRequested extends HomeEvent {
  const ProductLoadRequested();
}

class ProductByIdLoadRequested extends HomeEvent {
  const ProductByIdLoadRequested(this.id);
  final String id;
}
