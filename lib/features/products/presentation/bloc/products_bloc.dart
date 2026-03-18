import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/core/domain/data_state.dart';
import 'package:flutter_training/features/products/domain/entities/product.dart';
import 'package:flutter_training/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:flutter_training/features/products/presentation/bloc/products_event.dart';
import 'package:flutter_training/features/products/presentation/bloc/products_state.dart';

/// Bloc (event → state): UI adds events, Bloc reacts. Better traceability and
/// event transformers (e.g. debounce). Use Cubit when you only need simple methods.
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this._getProductsUseCase) : super(const ProductsInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  final GetProductsUseCase _getProductsUseCase;

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(const ProductsLoading());

    final result = await _getProductsUseCase();

    if (result is Success<List<Product>>) {
      final list = result.data ?? [];
      emit(ProductsLoaded(list));
    } else if (result is Error<List<Product>>) {
      emit(ProductsError(result.error ?? 'Failed to load products'));
    }
  }
}
