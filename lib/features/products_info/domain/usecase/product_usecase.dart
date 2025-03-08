import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:product_app/core/api_service/exception.dart';
import 'package:product_app/features/products_info/data/repository_imp/product_repo_impl.dart';
import 'package:product_app/features/products_info/domain/entity/product_entity.dart';
import 'package:product_app/features/products_info/domain/repository/product_repo.dart';

import '../../data/models/product_model.dart';

class ProductUsecase implements ProductRepository {
  final ProductRepository _productRepository;
  ProductUsecase(this._productRepository);
  @override
  Future<Result<List<ProductCategoriesEntity>, Failure>>
      getProductCategories() async {
    try {
      final result = await _productRepository.getProductCategories();
      if (result is Success<List<ProductCategoriesEntity>, Failure>) {
        return Success(result.success);
      } else {
        return Error(
          Failure(
            message: result.toString(),
          ),
        );
      }
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
      final result = await _productRepository.getProduct(productCategory: productCategory);
      if (result is Success<ProductModel, Failure>) {
        return Success(result.success);
      } else {
        return Error(
          Failure(
            message: result.toString(),
          ),
        );
      }
    } on Failure catch (e) {
      print(e.toString());
      return Error(e);
    } catch (e) {
      print(e.toString());
      return Error(Failure(exception: Exception(e), message: e.toString()));
    }
  }
}

final productUsecaseProvider = Provider<ProductUsecase>((ref) {
  final productRepository = ref.watch(productRepositoryProvider);
  return ProductUsecase(productRepository);
});
