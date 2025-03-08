import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

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


@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    List<Product>? products,
    int? total,
    int? skip,
    int? limit,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class Dimensions with _$Dimensions {
  const factory Dimensions({
    double? width,
    double? height,
    double? depth,
  }) = _Dimensions;

  factory Dimensions.fromJson(Map<String, dynamic> json) => _$DimensionsFromJson(json);
}

@freezed
class Review with _$Review {
  const factory Review({
    double? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    String? createdAt,
    String? updatedAt,
    String? barcode,
    String? qrCode,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
