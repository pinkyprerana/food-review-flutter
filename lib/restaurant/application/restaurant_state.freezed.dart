// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RestaurantState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Restaurant>? get restaurantList => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  dynamic get isMoreDataFetchable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestaurantStateCopyWith<RestaurantState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantStateCopyWith<$Res> {
  factory $RestaurantStateCopyWith(
          RestaurantState value, $Res Function(RestaurantState) then) =
      _$RestaurantStateCopyWithImpl<$Res, RestaurantState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Restaurant>? restaurantList,
      int currentPage,
      bool hasMore,
      int totalPages,
      dynamic isMoreDataFetchable});
}

/// @nodoc
class _$RestaurantStateCopyWithImpl<$Res, $Val extends RestaurantState>
    implements $RestaurantStateCopyWith<$Res> {
  _$RestaurantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? restaurantList = freezed,
    Object? currentPage = null,
    Object? hasMore = null,
    Object? totalPages = null,
    Object? isMoreDataFetchable = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantList: freezed == restaurantList
          ? _value.restaurantList
          : restaurantList // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      isMoreDataFetchable: freezed == isMoreDataFetchable
          ? _value.isMoreDataFetchable
          : isMoreDataFetchable // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantStateImplCopyWith<$Res>
    implements $RestaurantStateCopyWith<$Res> {
  factory _$$RestaurantStateImplCopyWith(_$RestaurantStateImpl value,
          $Res Function(_$RestaurantStateImpl) then) =
      __$$RestaurantStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Restaurant>? restaurantList,
      int currentPage,
      bool hasMore,
      int totalPages,
      dynamic isMoreDataFetchable});
}

/// @nodoc
class __$$RestaurantStateImplCopyWithImpl<$Res>
    extends _$RestaurantStateCopyWithImpl<$Res, _$RestaurantStateImpl>
    implements _$$RestaurantStateImplCopyWith<$Res> {
  __$$RestaurantStateImplCopyWithImpl(
      _$RestaurantStateImpl _value, $Res Function(_$RestaurantStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? restaurantList = freezed,
    Object? currentPage = null,
    Object? hasMore = null,
    Object? totalPages = null,
    Object? isMoreDataFetchable = freezed,
  }) {
    return _then(_$RestaurantStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantList: freezed == restaurantList
          ? _value._restaurantList
          : restaurantList // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      isMoreDataFetchable: freezed == isMoreDataFetchable
          ? _value.isMoreDataFetchable!
          : isMoreDataFetchable,
    ));
  }
}

/// @nodoc

class _$RestaurantStateImpl extends _RestaurantState {
  const _$RestaurantStateImpl(
      {this.isLoading = false,
      final List<Restaurant>? restaurantList = const [],
      this.currentPage = 1,
      this.hasMore = true,
      this.totalPages = 0,
      this.isMoreDataFetchable = true})
      : _restaurantList = restaurantList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<Restaurant>? _restaurantList;
  @override
  @JsonKey()
  List<Restaurant>? get restaurantList {
    final value = _restaurantList;
    if (value == null) return null;
    if (_restaurantList is EqualUnmodifiableListView) return _restaurantList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final dynamic isMoreDataFetchable;

  @override
  String toString() {
    return 'RestaurantState(isLoading: $isLoading, restaurantList: $restaurantList, currentPage: $currentPage, hasMore: $hasMore, totalPages: $totalPages, isMoreDataFetchable: $isMoreDataFetchable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._restaurantList, _restaurantList) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality()
                .equals(other.isMoreDataFetchable, isMoreDataFetchable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_restaurantList),
      currentPage,
      hasMore,
      totalPages,
      const DeepCollectionEquality().hash(isMoreDataFetchable));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantStateImplCopyWith<_$RestaurantStateImpl> get copyWith =>
      __$$RestaurantStateImplCopyWithImpl<_$RestaurantStateImpl>(
          this, _$identity);
}

abstract class _RestaurantState extends RestaurantState {
  const factory _RestaurantState(
      {final bool isLoading,
      final List<Restaurant>? restaurantList,
      final int currentPage,
      final bool hasMore,
      final int totalPages,
      final dynamic isMoreDataFetchable}) = _$RestaurantStateImpl;
  const _RestaurantState._() : super._();

  @override
  bool get isLoading;
  @override
  List<Restaurant>? get restaurantList;
  @override
  int get currentPage;
  @override
  bool get hasMore;
  @override
  int get totalPages;
  @override
  dynamic get isMoreDataFetchable;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantStateImplCopyWith<_$RestaurantStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
