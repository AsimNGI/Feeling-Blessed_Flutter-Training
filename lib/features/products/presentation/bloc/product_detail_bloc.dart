import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/core/domain/data_state.dart';
import 'package:flutter_training/features/products/domain/entities/product.dart';
import 'package:flutter_training/features/products/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:flutter_training/features/products/presentation/bloc/product_detail_event.dart';
import 'package:flutter_training/features/products/presentation/bloc/product_detail_state.dart';


class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(this._getProductByIdUseCase)
      : super(const ProductDetailInitial()) {
    on<LoadProductDetail>(_onLoadProductDetail);
  }

  final GetProductByIdUseCase _getProductByIdUseCase;

  Future<void> _onLoadProductDetail(
    LoadProductDetail event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(const ProductDetailLoading());

    final result = await _getProductByIdUseCase(event.productId);

    if (result is Success<Product>) {
      emit(ProductDetailLoaded(result.data!));
    } else if (result is Error<Product>) {
      emit(ProductDetailError(result.error ?? 'Failed to load product'));
    }
  }
}
