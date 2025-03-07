import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_app/features/products_info/domain/enums/product_status.dart';
import 'package:product_app/features/products_info/domain/usecase/product_usecase.dart';
import 'package:product_app/features/products_info/presentation/state/product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier(this.productUsecase, super.state);

  final ProductUsecase productUsecase;

  Future<void> getProductCategories() async {
    try {
      state = state.copyWith(
        productStatus: ProductStatus.loading,
      );

      final product = await productUsecase.getProductCategories();
      product.when((success) {
        state = state.copyWith(
          productStatus: ProductStatus.productFetched,
          productCategories: success,
        );

        /// showing topics in terminal
        log(state.productCategories.first.name.toString());
      }, (error) {
        state = state.copyWith(
          productStatus: ProductStatus.failed,
          errorMessage: error.toString(),
        );
      });
    } catch (e) {
      state = state.copyWith(
        productStatus: ProductStatus.failed,
        errorMessage: e.toString(),
      );
    }
  }
}

/// Controller for product category Presentation Layer
final productProvider =
    StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  final productUsecase = ref.watch(productUsecaseProvider);
  return ProductNotifier(productUsecase, const ProductState());
});
