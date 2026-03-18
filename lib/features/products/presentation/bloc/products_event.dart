import 'package:equatable/equatable.dart';

/// Events for ProductsBloc. UI dispatches events; Bloc maps them to states.
sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

final class LoadProducts extends ProductsEvent {
  const LoadProducts();
}
