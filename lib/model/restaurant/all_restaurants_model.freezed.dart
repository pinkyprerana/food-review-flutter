// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_restaurants_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllRestaurantsModel _$AllRestaurantsModelFromJson(Map<String, dynamic> json) {
  return _AllRestaurantsModel.fromJson(json);
}

/// @nodoc
mixin _$AllRestaurantsModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<RestaurantData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllRestaurantsModelCopyWith<AllRestaurantsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllRestaurantsModelCopyWith<$Res> {
  factory $AllRestaurantsModelCopyWith(
          AllRestaurantsModel value, $Res Function(AllRestaurantsModel) then) =
      _$AllRestaurantsModelCopyWithImpl<$Res, AllRestaurantsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<RestaurantData>? data});
}

/// @nodoc
class _$AllRestaurantsModelCopyWithImpl<$Res, $Val extends AllRestaurantsModel>
    implements $AllRestaurantsModelCopyWith<$Res> {
  _$AllRestaurantsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RestaurantData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllRestaurantsModelImplCopyWith<$Res>
    implements $AllRestaurantsModelCopyWith<$Res> {
  factory _$$AllRestaurantsModelImplCopyWith(_$AllRestaurantsModelImpl value,
          $Res Function(_$AllRestaurantsModelImpl) then) =
      __$$AllRestaurantsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<RestaurantData>? data});
}

/// @nodoc
class __$$AllRestaurantsModelImplCopyWithImpl<$Res>
    extends _$AllRestaurantsModelCopyWithImpl<$Res, _$AllRestaurantsModelImpl>
    implements _$$AllRestaurantsModelImplCopyWith<$Res> {
  __$$AllRestaurantsModelImplCopyWithImpl(_$AllRestaurantsModelImpl _value,
      $Res Function(_$AllRestaurantsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$AllRestaurantsModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RestaurantData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllRestaurantsModelImpl implements _AllRestaurantsModel {
  const _$AllRestaurantsModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") final List<RestaurantData>? data})
      : _data = data;

  factory _$AllRestaurantsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllRestaurantsModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<RestaurantData>? _data;
  @override
  @JsonKey(name: "data")
  List<RestaurantData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AllRestaurantsModel(status: $status, type: $type, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllRestaurantsModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, type, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllRestaurantsModelImplCopyWith<_$AllRestaurantsModelImpl> get copyWith =>
      __$$AllRestaurantsModelImplCopyWithImpl<_$AllRestaurantsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllRestaurantsModelImplToJson(
      this,
    );
  }
}

abstract class _AllRestaurantsModel implements AllRestaurantsModel {
  const factory _AllRestaurantsModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final List<RestaurantData>? data}) =
      _$AllRestaurantsModelImpl;

  factory _AllRestaurantsModel.fromJson(Map<String, dynamic> json) =
      _$AllRestaurantsModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  int? get status;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  List<RestaurantData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$AllRestaurantsModelImplCopyWith<_$AllRestaurantsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantData _$RestaurantDataFromJson(Map<String, dynamic> json) {
  return _RestaurantData.fromJson(json);
}

/// @nodoc
mixin _$RestaurantData {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "lng")
  String? get lng => throw _privateConstructorUsedError;
  @JsonKey(name: "lat")
  String? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  String? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantDataCopyWith<RestaurantData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDataCopyWith<$Res> {
  factory $RestaurantDataCopyWith(
          RestaurantData value, $Res Function(RestaurantData) then) =
      _$RestaurantDataCopyWithImpl<$Res, RestaurantData>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "lng") String? lng,
      @JsonKey(name: "lat") String? lat,
      @JsonKey(name: "rating") String? rating});
}

/// @nodoc
class _$RestaurantDataCopyWithImpl<$Res, $Val extends RestaurantData>
    implements $RestaurantDataCopyWith<$Res> {
  _$RestaurantDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lng = freezed,
    Object? lat = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantDataImplCopyWith<$Res>
    implements $RestaurantDataCopyWith<$Res> {
  factory _$$RestaurantDataImplCopyWith(_$RestaurantDataImpl value,
          $Res Function(_$RestaurantDataImpl) then) =
      __$$RestaurantDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "lng") String? lng,
      @JsonKey(name: "lat") String? lat,
      @JsonKey(name: "rating") String? rating});
}

/// @nodoc
class __$$RestaurantDataImplCopyWithImpl<$Res>
    extends _$RestaurantDataCopyWithImpl<$Res, _$RestaurantDataImpl>
    implements _$$RestaurantDataImplCopyWith<$Res> {
  __$$RestaurantDataImplCopyWithImpl(
      _$RestaurantDataImpl _value, $Res Function(_$RestaurantDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lng = freezed,
    Object? lat = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$RestaurantDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantDataImpl implements _RestaurantData {
  const _$RestaurantDataImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "lng") this.lng,
      @JsonKey(name: "lat") this.lat,
      @JsonKey(name: "rating") this.rating});

  factory _$RestaurantDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantDataImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "lng")
  final String? lng;
  @override
  @JsonKey(name: "lat")
  final String? lat;
  @override
  @JsonKey(name: "rating")
  final String? rating;

  @override
  String toString() {
    return 'RestaurantData(id: $id, name: $name, lng: $lng, lat: $lat, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lng, lat, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantDataImplCopyWith<_$RestaurantDataImpl> get copyWith =>
      __$$RestaurantDataImplCopyWithImpl<_$RestaurantDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantDataImplToJson(
      this,
    );
  }
}

abstract class _RestaurantData implements RestaurantData {
  const factory _RestaurantData(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "lng") final String? lng,
      @JsonKey(name: "lat") final String? lat,
      @JsonKey(name: "rating") final String? rating}) = _$RestaurantDataImpl;

  factory _RestaurantData.fromJson(Map<String, dynamic> json) =
      _$RestaurantDataImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "lng")
  String? get lng;
  @override
  @JsonKey(name: "lat")
  String? get lat;
  @override
  @JsonKey(name: "rating")
  String? get rating;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantDataImplCopyWith<_$RestaurantDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
