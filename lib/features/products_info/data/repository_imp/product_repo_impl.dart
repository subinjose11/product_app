import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:product_app/core/api_service/exception.dart';
import 'package:product_app/features/products_info/data/datasource/product_data_source.dart';
import 'package:product_app/features/products_info/data/models/product_categories_model.dart';
import 'package:product_app/features/products_info/domain/entity/product_entity.dart';
import 'package:product_app/features/products_info/domain/repository/product_repo.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _productDataSource;

  ProductRepositoryImpl(this._productDataSource);

  @override
  Future<Result<List<ProductCategoriesEntity>, Failure>>
      getProductCategories() async {
    try {
      List<ProductCategoriesModel> result =
          await _productDataSource.getProductCategories();
      final product = result
          .map((e) => ProductCategoriesEntity(name: e.name, url: e.url))
          .toList();
      return Success(product);
    } on Failure catch (e) {
      return Error(e);
    } catch (e) {
      return Error(Failure(exception: Exception(e), message: e.toString()));
    }
  }
}

final productRepositoryProvider = Provider<ProductRepositoryImpl>((ref) {
  final productDataSource = ref.watch(productDataSourceProvider);
  return ProductRepositoryImpl(productDataSource);
});
