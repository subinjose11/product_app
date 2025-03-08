// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductState {
  ProductCategoryStatus get productCategoryStatus =>
      throw _privateConstructorUsedError;
  ProductStatus get productStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<ProductCategoriesEntity> get productCategories =>
      throw _privateConstructorUsedError;
  String get selectedCategory => throw _privateConstructorUsedError;
  Map<String, List<Product>> get categoryProductMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
  @useResult
  $Res call(
      {ProductCategoryStatus productCategoryStatus,
      ProductStatus productStatus,
      String errorMessage,
      List<ProductCategoriesEntity> productCategories,
      String selectedCategory,
      Map<String, List<Product>> categoryProductMap});
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productCategoryStatus = null,
    Object? productStatus = null,
    Object? errorMessage = null,
    Object? productCategories = null,
    Object? selectedCategory = null,
    Object? categoryProductMap = null,
  }) {
    return _then(_value.copyWith(
      productCategoryStatus: null == productCategoryStatus
          ? _value.productCategoryStatus
          : productCategoryStatus // ignore: cast_nullable_to_non_nullable
              as ProductCategoryStatus,
      productStatus: null == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as ProductStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      productCategories: null == productCategories
          ? _value.productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategoriesEntity>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      categoryProductMap: null == categoryProductMap
          ? _value.categoryProductMap
          : categoryProductMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Product>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStateImplCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$$ProductStateImplCopyWith(
          _$ProductStateImpl value, $Res Function(_$ProductStateImpl) then) =
      __$$ProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProductCategoryStatus productCategoryStatus,
      ProductStatus productStatus,
      String errorMessage,
      List<ProductCategoriesEntity> productCategories,
      String selectedCategory,
      Map<String, List<Product>> categoryProductMap});
}

/// @nodoc
class __$$ProductStateImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductStateImpl>
    implements _$$ProductStateImplCopyWith<$Res> {
  __$$ProductStateImplCopyWithImpl(
      _$ProductStateImpl _value, $Res Function(_$ProductStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productCategoryStatus = null,
    Object? productStatus = null,
    Object? errorMessage = null,
    Object? productCategories = null,
    Object? selectedCategory = null,
    Object? categoryProductMap = null,
  }) {
    return _then(_$ProductStateImpl(
      productCategoryStatus: null == productCategoryStatus
          ? _value.productCategoryStatus
          : productCategoryStatus // ignore: cast_nullable_to_non_nullable
              as ProductCategoryStatus,
      productStatus: null == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as ProductStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      productCategories: null == productCategories
          ? _value._productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategoriesEntity>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      categoryProductMap: null == categoryProductMap
          ? _value._categoryProductMap
          : categoryProductMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Product>>,
    ));
  }
}

/// @nodoc

class _$ProductStateImpl implements _ProductState {
  const _$ProductStateImpl(
      {this.productCategoryStatus = ProductCategoryStatus.idle,
      this.productStatus = ProductStatus.idle,
      this.errorMessage = '',
      final List<ProductCategoriesEntity> productCategories = const [],
      this.selectedCategory = '',
      final Map<String, List<Product>> categoryProductMap = const {}})
      : _productCategories = productCategories,
        _categoryProductMap = categoryProductMap;

  @override
  @JsonKey()
  final ProductCategoryStatus productCategoryStatus;
  @override
  @JsonKey()
  final ProductStatus productStatus;
  @override
  @JsonKey()
  final String errorMessage;
  final List<ProductCategoriesEntity> _productCategories;
  @override
  @JsonKey()
  List<ProductCategoriesEntity> get productCategories {
    if (_productCategories is EqualUnmodifiableListView)
      return _productCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productCategories);
  }

  @override
  @JsonKey()
  final String selectedCategory;
  final Map<String, List<Product>> _categoryProductMap;
  @override
  @JsonKey()
  Map<String, List<Product>> get categoryProductMap {
    if (_categoryProductMap is EqualUnmodifiableMapView)
      return _categoryProductMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryProductMap);
  }

  @override
  String toString() {
    return 'ProductState(productCategoryStatus: $productCategoryStatus, productStatus: $productStatus, errorMessage: $errorMessage, productCategories: $productCategories, selectedCategory: $selectedCategory, categoryProductMap: $categoryProductMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStateImpl &&
            (identical(other.productCategoryStatus, productCategoryStatus) ||
                other.productCategoryStatus == productCategoryStatus) &&
            (identical(other.productStatus, productStatus) ||
                other.productStatus == productStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._productCategories, _productCategories) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            const DeepCollectionEquality()
                .equals(other._categoryProductMap, _categoryProductMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productCategoryStatus,
      productStatus,
      errorMessage,
      const DeepCollectionEquality().hash(_productCategories),
      selectedCategory,
      const DeepCollectionEquality().hash(_categoryProductMap));

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      __$$ProductStateImplCopyWithImpl<_$ProductStateImpl>(this, _$identity);
}

abstract class _ProductState implements ProductState {
  const factory _ProductState(
          {final ProductCategoryStatus productCategoryStatus,
          final ProductStatus productStatus,
          final String errorMessage,
          final List<ProductCategoriesEntity> productCategories,
          final String selectedCategory,
          final Map<String, List<Product>> categoryProductMap}) =
      _$ProductStateImpl;

  @override
  ProductCategoryStatus get productCategoryStatus;
  @override
  ProductStatus get productStatus;
  @override
  String get errorMessage;
  @override
  List<ProductCategoriesEntity> get productCategories;
  @override
  String get selectedCategory;
  @override
  Map<String, List<Product>> get categoryProductMap;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
