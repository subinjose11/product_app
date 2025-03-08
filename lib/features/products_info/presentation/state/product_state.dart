import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_app/features/products_info/data/models/product_model.dart';
import 'package:product_app/features/products_info/domain/entity/product_entity.dart';
import 'package:product_app/features/products_info/domain/enums/product_status.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(ProductCategoryStatus.idle) final ProductCategoryStatus productCategoryStatus,
    @Default(ProductStatus.idle) final ProductStatus productStatus,
    @Default('') final String errorMessage,
    @Default([]) final List<ProductCategoriesEntity> productCategories,
    @Default('') final String selectedCategory,
    @Default({}) final Map<String ,List<Product>> categoryProductMap,
  }) = _ProductState;
}
