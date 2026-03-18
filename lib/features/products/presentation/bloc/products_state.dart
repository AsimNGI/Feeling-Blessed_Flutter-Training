import 'package:equatable/equatable.dart';
import 'package:flutter_training/features/products/domain/entities/product.dart';

/// Union (sealed) state: exactly one variant at a time.
/// Use Bloc for event-driven flows and traceability; Cubit is for simple method calls.
sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

final class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

final class ProductsLoaded extends ProductsState {
  const ProductsLoaded(this.products);

  final List<Product> products;

  @override
  List<Object?> get props => [products];
}

final class ProductsError extends ProductsState {
  const ProductsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
