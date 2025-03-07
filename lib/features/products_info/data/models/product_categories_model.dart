import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'product_categories_model.freezed.dart';
part 'product_categories_model.g.dart';

List<ProductCategoriesModel> productCategoriesModelFromJson(String str) =>
    List<ProductCategoriesModel>.from(
        json.decode(str).map((x) => ProductCategoriesModel.fromJson(x))
    );

String productCategoriesModelToJson(List<ProductCategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ProductCategoriesModel with _$ProductCategoriesModel {
  const factory ProductCategoriesModel({
    required String slug,
    required String name,
    required String url,
  }) = _ProductCategoriesModel;

  factory ProductCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoriesModelFromJson(json);
}