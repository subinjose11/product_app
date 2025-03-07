// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_categories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductCategoriesModel _$ProductCategoriesModelFromJson(
    Map<String, dynamic> json) {
  return _ProductCategoriesModel.fromJson(json);
}

/// @nodoc
mixin _$ProductCategoriesModel {
  String get slug => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this ProductCategoriesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductCategoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCategoriesModelCopyWith<ProductCategoriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoriesModelCopyWith<$Res> {
  factory $ProductCategoriesModelCopyWith(ProductCategoriesModel value,
          $Res Function(ProductCategoriesModel) then) =
      _$ProductCategoriesModelCopyWithImpl<$Res, ProductCategoriesModel>;
  @useResult
  $Res call({String slug, String name, String url});
}

/// @nodoc
class _$ProductCategoriesModelCopyWithImpl<$Res,
        $Val extends ProductCategoriesModel>
    implements $ProductCategoriesModelCopyWith<$Res> {
  _$ProductCategoriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductCategoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductCategoriesModelImplCopyWith<$Res>
    implements $ProductCategoriesModelCopyWith<$Res> {
  factory _$$ProductCategoriesModelImplCopyWith(
          _$ProductCategoriesModelImpl value,
          $Res Function(_$ProductCategoriesModelImpl) then) =
      __$$ProductCategoriesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug, String name, String url});
}

/// @nodoc
class __$$ProductCategoriesModelImplCopyWithImpl<$Res>
    extends _$ProductCategoriesModelCopyWithImpl<$Res,
        _$ProductCategoriesModelImpl>
    implements _$$ProductCategoriesModelImplCopyWith<$Res> {
  __$$ProductCategoriesModelImplCopyWithImpl(
      _$ProductCategoriesModelImpl _value,
      $Res Function(_$ProductCategoriesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductCategoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$ProductCategoriesModelImpl(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductCategoriesModelImpl implements _ProductCategoriesModel {
  const _$ProductCategoriesModelImpl(
      {required this.slug, required this.name, required this.url});

  factory _$ProductCategoriesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductCategoriesModelImplFromJson(json);

  @override
  final String slug;
  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'ProductCategoriesModel(slug: $slug, name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCategoriesModelImpl &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slug, name, url);

  /// Create a copy of ProductCategoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCategoriesModelImplCopyWith<_$ProductCategoriesModelImpl>
      get copyWith => __$$ProductCategoriesModelImplCopyWithImpl<
          _$ProductCategoriesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductCategoriesModelImplToJson(
      this,
    );
  }
}

abstract class _ProductCategoriesModel implements ProductCategoriesModel {
  const factory _ProductCategoriesModel(
      {required final String slug,
      required final String name,
      required final String url}) = _$ProductCategoriesModelImpl;

  factory _ProductCategoriesModel.fromJson(Map<String, dynamic> json) =
      _$ProductCategoriesModelImpl.fromJson;

  @override
  String get slug;
  @override
  String get name;
  @override
  String get url;

  /// Create a copy of ProductCategoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductCategoriesModelImplCopyWith<_$ProductCategoriesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
