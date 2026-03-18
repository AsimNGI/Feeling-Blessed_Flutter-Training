import 'package:equatable/equatable.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object?> get props => [];
}

final class LoadProductDetail extends ProductDetailEvent {
  const LoadProductDetail(this.productId);

  final String productId;

  @override
  List<Object?> get props => [productId];
}
