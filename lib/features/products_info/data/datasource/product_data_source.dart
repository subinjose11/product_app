import 'dart:convert';

import 'package:product_app/core/api_service/api_service.dart';
import 'package:product_app/core/constants/constants.dart';
import 'package:product_app/features/products_info/data/models/product_model.dart';
import 'package:riverpod/riverpod.dart';

class ProductDataSource {
  final ApiClient _apiClient;

  ProductDataSource({required ApiClient apiClient}) : _apiClient = apiClient;

  /// Fetches a list of product category
  Future<List<ProductCategoriesModel>> getProductCategories() async {
    final response = await _apiClient.get('/categories', fromJson: (json) {
      return (json as List)
          .map((item) => ProductCategoriesModel.fromJson(item))
          .toList();
    });
    if (response.isSuccess) {
      print(response.data);
      return response.data!;
    } else {
      print(response.error);
      throw Exception(response.error);
    }
  }

  /// Fetches a list of product category
  Future<ProductModel> getProduct({required String productCategory}) async {
    final response =
        await _apiClient.get('/category/$productCategory', fromJson: (json) {
      if (json is Map<String, dynamic>) {
        return ProductModel.fromJson(json);
      }

      return null;
    });

    if (response.isSuccess) {
      // print(response.data);
      return response.data!;
    } else {
      print(response.error);
      throw Exception(response.error);
    }
  }
}

final productDataSourceProvider = Provider<ProductDataSource>(
  (ref) {
    final baseUrl = ref.watch(baseUrlProvider);
    return ProductDataSource(apiClient: ApiClient(baseUrl: baseUrl));
  },
);
