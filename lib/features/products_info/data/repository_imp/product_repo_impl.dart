import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:product_app/core/api_service/exception.dart';
import 'package:product_app/features/products_info/data/datasource/product_data_source.dart';
import 'package:product_app/features/products_info/data/models/product_model.dart';
import 'package:product_app/features/products_info/domain/repository/product_repo.dart';

import '../../domain/entity/product_entity.dart';


class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _productDataSource;

  ProductRepositoryImpl(this._productDataSource);

  @override
  Future<Result<List<ProductCategoriesEntity>, Failure>>
      getProductCategories() async {
    try {
      List<ProductCategoriesModel> result =
          await _productDataSource.getProductCategories();
      final  productCategories = result
          .map((e) =>
              ProductCategoriesEntity(slug: e.slug, name: e.name, url: e.url))
          .toList();
      return Success(productCategories);
    } on Failure catch (e) {
      return Error(e);
    } catch (e) {
      return Error(Failure(exception: Exception(e), message: e.toString()));
    }
  }

  @override
  Future<Result<ProductModel, Failure>> getProduct(
      {required String productCategory}) async {
    try {
      ProductModel result =
          await _productDataSource.getProduct(productCategory: productCategory);

      // final product = result
      //     .map((e) =>
      //     ProductEntity(
      //         products: e.products!.map((product) => p.Product.fromMap(product.toJson())).toList(),
      //         total: e.total!,
      //         skip: e.skip!,
      //         limit: e.limit!
      //     )
      // )
      //     .toList();
      return Success(result);
    } on Failure catch (e) {
      print(e.toString());
      return Error(e);

    } catch (e) {
      print(e.toString());
      return Error(Failure(exception: Exception(e), message: e.toString()));
    }
  }
}

final productRepositoryProvider = Provider<ProductRepositoryImpl>((ref) {
  final productDataSource = ref.watch(productDataSourceProvider);
  return ProductRepositoryImpl(productDataSource);
});
