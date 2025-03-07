import 'package:multiple_result/multiple_result.dart';
import 'package:product_app/core/api_service/exception.dart';
import 'package:product_app/features/products_info/domain/entity/product_entity.dart';

abstract interface class ProductRepository {
  Future<Result<List<ProductCategoriesEntity>, Failure>> getProductCategories();
}
