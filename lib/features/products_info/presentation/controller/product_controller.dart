import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_app/features/products_info/data/models/product_model.dart';
import 'package:product_app/features/products_info/domain/enums/product_status.dart';
import 'package:product_app/features/products_info/domain/usecase/product_usecase.dart';
import 'package:product_app/features/products_info/presentation/state/product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier(this.productUsecase, super.state);

  final ProductUsecase productUsecase;

  Future<void> getProductCategories() async {
    try {
      state = state.copyWith(
        productCategoryStatus: ProductCategoryStatus.loading,
      );

      final product = await productUsecase.getProductCategories();
      product.when((success) {
        state = state.copyWith(
          productCategoryStatus: ProductCategoryStatus.productCategoryFetched,
          productCategories: success,
        );

        onProductCategoryTabClicked(success.first.slug);
      }, (error) {
        state = state.copyWith(
          productCategoryStatus: ProductCategoryStatus.failed,
          errorMessage: error.toString(),
        );
      });
    } catch (e) {
      state = state.copyWith(
        productCategoryStatus: ProductCategoryStatus.failed,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> onProductCategoryTabClicked(String categoryName) async {
    final updatedProductCategory = state.categoryProductMap;
    if (updatedProductCategory.containsKey(categoryName)) {
      state = state.copyWith(
          selectedCategory: categoryName,
          categoryProductMap: updatedProductCategory);
      return;
    }
    getProduct(productCategory: categoryName);
  }

  Future<void> getProduct({required String productCategory}) async {
    try {
      state = state.copyWith(
        productStatus: ProductStatus.productLoading,
      );

      final product = await productUsecase.getProduct(productCategory: productCategory);

      product.when(
              (success) {
            // Create a new map only once by using spread operator
            state = state.copyWith(
              productStatus: ProductStatus.productFetched,
              selectedCategory: productCategory,
              categoryProductMap: {
                ...state.categoryProductMap,
                productCategory: success.products ?? [],
              },
            );
          },
              (error) {
            state = state.copyWith(
              productStatus: ProductStatus.productFetchingFailed,
              errorMessage: error.toString(),
            );
          }
      );
    } catch (e) {
      state = state.copyWith(
        productStatus: ProductStatus.productFetchingFailed,
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
