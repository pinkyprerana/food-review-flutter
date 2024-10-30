// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestaurantDetailsModel _$RestaurantDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _RestaurantDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurantDetailsModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  RestaurantDetails? get restaurantDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this RestaurantDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantDetailsModelCopyWith<RestaurantDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDetailsModelCopyWith<$Res> {
  factory $RestaurantDetailsModelCopyWith(RestaurantDetailsModel value,
          $Res Function(RestaurantDetailsModel) then) =
      _$RestaurantDetailsModelCopyWithImpl<$Res, RestaurantDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") RestaurantDetails? restaurantDetails});

  $RestaurantDetailsCopyWith<$Res>? get restaurantDetails;
}

/// @nodoc
class _$RestaurantDetailsModelCopyWithImpl<$Res,
        $Val extends RestaurantDetailsModel>
    implements $RestaurantDetailsModelCopyWith<$Res> {
  _$RestaurantDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? restaurantDetails = freezed,
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
      restaurantDetails: freezed == restaurantDetails
          ? _value.restaurantDetails
          : restaurantDetails // ignore: cast_nullable_to_non_nullable
              as RestaurantDetails?,
    ) as $Val);
  }

  /// Create a copy of RestaurantDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RestaurantDetailsCopyWith<$Res>? get restaurantDetails {
    if (_value.restaurantDetails == null) {
      return null;
    }

    return $RestaurantDetailsCopyWith<$Res>(_value.restaurantDetails!, (value) {
      return _then(_value.copyWith(restaurantDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantDetailsModelImplCopyWith<$Res>
    implements $RestaurantDetailsModelCopyWith<$Res> {
  factory _$$RestaurantDetailsModelImplCopyWith(
          _$RestaurantDetailsModelImpl value,
          $Res Function(_$RestaurantDetailsModelImpl) then) =
      __$$RestaurantDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") RestaurantDetails? restaurantDetails});

  @override
  $RestaurantDetailsCopyWith<$Res>? get restaurantDetails;
}

/// @nodoc
class __$$RestaurantDetailsModelImplCopyWithImpl<$Res>
    extends _$RestaurantDetailsModelCopyWithImpl<$Res,
        _$RestaurantDetailsModelImpl>
    implements _$$RestaurantDetailsModelImplCopyWith<$Res> {
  __$$RestaurantDetailsModelImplCopyWithImpl(
      _$RestaurantDetailsModelImpl _value,
      $Res Function(_$RestaurantDetailsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? restaurantDetails = freezed,
  }) {
    return _then(_$RestaurantDetailsModelImpl(
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
      restaurantDetails: freezed == restaurantDetails
          ? _value.restaurantDetails
          : restaurantDetails // ignore: cast_nullable_to_non_nullable
              as RestaurantDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantDetailsModelImpl implements _RestaurantDetailsModel {
  const _$RestaurantDetailsModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.restaurantDetails});

  factory _$RestaurantDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantDetailsModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "data")
  final RestaurantDetails? restaurantDetails;

  @override
  String toString() {
    return 'RestaurantDetailsModel(status: $status, type: $type, message: $message, restaurantDetails: $restaurantDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantDetailsModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.restaurantDetails, restaurantDetails) ||
                other.restaurantDetails == restaurantDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, type, message, restaurantDetails);

  /// Create a copy of RestaurantDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantDetailsModelImplCopyWith<_$RestaurantDetailsModelImpl>
      get copyWith => __$$RestaurantDetailsModelImplCopyWithImpl<
          _$RestaurantDetailsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _RestaurantDetailsModel implements RestaurantDetailsModel {
  const factory _RestaurantDetailsModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final RestaurantDetails? restaurantDetails}) =
      _$RestaurantDetailsModelImpl;

  factory _RestaurantDetailsModel.fromJson(Map<String, dynamic> json) =
      _$RestaurantDetailsModelImpl.fromJson;

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
  RestaurantDetails? get restaurantDetails;

  /// Create a copy of RestaurantDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantDetailsModelImplCopyWith<_$RestaurantDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RestaurantDetails _$RestaurantDetailsFromJson(Map<String, dynamic> json) {
  return _RestaurantDetails.fromJson(json);
}

/// @nodoc
mixin _$RestaurantDetails {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  List<String>? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "street")
  String? get street => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: "zipcode")
  String? get zipcode => throw _privateConstructorUsedError;
  @JsonKey(name: "geo_loc")
  GeoLoc? get geoLoc => throw _privateConstructorUsedError;
  @JsonKey(name: "lng")
  String? get lng => throw _privateConstructorUsedError;
  @JsonKey(name: "lat")
  String? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: "landmark")
  String? get landmark => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "place_id")
  String? get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  String? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "user_ratings_total")
  String? get userRatingsTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "types")
  List<dynamic>? get types => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "google_rating")
  int? get googleRating => throw _privateConstructorUsedError;
  @JsonKey(name: "restaurant_user_count")
  int? get restaurantUserCount => throw _privateConstructorUsedError;
  @JsonKey(name: "restaurant_rating")
  double? get restaurantRating => throw _privateConstructorUsedError;
  @JsonKey(name: "isReview")
  bool? get isReview => throw _privateConstructorUsedError;
  @JsonKey(name: "isSave")
  bool? get isSave => throw _privateConstructorUsedError;
  @JsonKey(name: "total_user_count")
  int? get totalUserCount => throw _privateConstructorUsedError;
  @JsonKey(name: "total_rating")
  double? get totalRating => throw _privateConstructorUsedError;

  /// Serializes this RestaurantDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantDetailsCopyWith<RestaurantDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDetailsCopyWith<$Res> {
  factory $RestaurantDetailsCopyWith(
          RestaurantDetails value, $Res Function(RestaurantDetails) then) =
      _$RestaurantDetailsCopyWithImpl<$Res, RestaurantDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "image") List<String>? image,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "street") String? street,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "zipcode") String? zipcode,
      @JsonKey(name: "geo_loc") GeoLoc? geoLoc,
      @JsonKey(name: "lng") String? lng,
      @JsonKey(name: "lat") String? lat,
      @JsonKey(name: "landmark") String? landmark,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "place_id") String? placeId,
      @JsonKey(name: "rating") String? rating,
      @JsonKey(name: "user_ratings_total") String? userRatingsTotal,
      @JsonKey(name: "types") List<dynamic>? types,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "google_rating") int? googleRating,
      @JsonKey(name: "restaurant_user_count") int? restaurantUserCount,
      @JsonKey(name: "restaurant_rating") double? restaurantRating,
      @JsonKey(name: "isReview") bool? isReview,
      @JsonKey(name: "isSave") bool? isSave,
      @JsonKey(name: "total_user_count") int? totalUserCount,
      @JsonKey(name: "total_rating") double? totalRating});

  $GeoLocCopyWith<$Res>? get geoLoc;
}

/// @nodoc
class _$RestaurantDetailsCopyWithImpl<$Res, $Val extends RestaurantDetails>
    implements $RestaurantDetailsCopyWith<$Res> {
  _$RestaurantDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? street = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? zipcode = freezed,
    Object? geoLoc = freezed,
    Object? lng = freezed,
    Object? lat = freezed,
    Object? landmark = freezed,
    Object? phone = freezed,
    Object? description = freezed,
    Object? placeId = freezed,
    Object? rating = freezed,
    Object? userRatingsTotal = freezed,
    Object? types = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? googleRating = freezed,
    Object? restaurantUserCount = freezed,
    Object? restaurantRating = freezed,
    Object? isReview = freezed,
    Object? isSave = freezed,
    Object? totalUserCount = freezed,
    Object? totalRating = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      zipcode: freezed == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String?,
      geoLoc: freezed == geoLoc
          ? _value.geoLoc
          : geoLoc // ignore: cast_nullable_to_non_nullable
              as GeoLoc?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      userRatingsTotal: freezed == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      googleRating: freezed == googleRating
          ? _value.googleRating
          : googleRating // ignore: cast_nullable_to_non_nullable
              as int?,
      restaurantUserCount: freezed == restaurantUserCount
          ? _value.restaurantUserCount
          : restaurantUserCount // ignore: cast_nullable_to_non_nullable
              as int?,
      restaurantRating: freezed == restaurantRating
          ? _value.restaurantRating
          : restaurantRating // ignore: cast_nullable_to_non_nullable
              as double?,
      isReview: freezed == isReview
          ? _value.isReview
          : isReview // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSave: freezed == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalUserCount: freezed == totalUserCount
          ? _value.totalUserCount
          : totalUserCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRating: freezed == totalRating
          ? _value.totalRating
          : totalRating // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of RestaurantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoLocCopyWith<$Res>? get geoLoc {
    if (_value.geoLoc == null) {
      return null;
    }

    return $GeoLocCopyWith<$Res>(_value.geoLoc!, (value) {
      return _then(_value.copyWith(geoLoc: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantDetailsImplCopyWith<$Res>
    implements $RestaurantDetailsCopyWith<$Res> {
  factory _$$RestaurantDetailsImplCopyWith(_$RestaurantDetailsImpl value,
          $Res Function(_$RestaurantDetailsImpl) then) =
      __$$RestaurantDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "image") List<String>? image,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "street") String? street,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "zipcode") String? zipcode,
      @JsonKey(name: "geo_loc") GeoLoc? geoLoc,
      @JsonKey(name: "lng") String? lng,
      @JsonKey(name: "lat") String? lat,
      @JsonKey(name: "landmark") String? landmark,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "place_id") String? placeId,
      @JsonKey(name: "rating") String? rating,
      @JsonKey(name: "user_ratings_total") String? userRatingsTotal,
      @JsonKey(name: "types") List<dynamic>? types,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "google_rating") int? googleRating,
      @JsonKey(name: "restaurant_user_count") int? restaurantUserCount,
      @JsonKey(name: "restaurant_rating") double? restaurantRating,
      @JsonKey(name: "isReview") bool? isReview,
      @JsonKey(name: "isSave") bool? isSave,
      @JsonKey(name: "total_user_count") int? totalUserCount,
      @JsonKey(name: "total_rating") double? totalRating});

  @override
  $GeoLocCopyWith<$Res>? get geoLoc;
}

/// @nodoc
class __$$RestaurantDetailsImplCopyWithImpl<$Res>
    extends _$RestaurantDetailsCopyWithImpl<$Res, _$RestaurantDetailsImpl>
    implements _$$RestaurantDetailsImplCopyWith<$Res> {
  __$$RestaurantDetailsImplCopyWithImpl(_$RestaurantDetailsImpl _value,
      $Res Function(_$RestaurantDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? street = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? zipcode = freezed,
    Object? geoLoc = freezed,
    Object? lng = freezed,
    Object? lat = freezed,
    Object? landmark = freezed,
    Object? phone = freezed,
    Object? description = freezed,
    Object? placeId = freezed,
    Object? rating = freezed,
    Object? userRatingsTotal = freezed,
    Object? types = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? googleRating = freezed,
    Object? restaurantUserCount = freezed,
    Object? restaurantRating = freezed,
    Object? isReview = freezed,
    Object? isSave = freezed,
    Object? totalUserCount = freezed,
    Object? totalRating = freezed,
  }) {
    return _then(_$RestaurantDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      zipcode: freezed == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String?,
      geoLoc: freezed == geoLoc
          ? _value.geoLoc
          : geoLoc // ignore: cast_nullable_to_non_nullable
              as GeoLoc?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      userRatingsTotal: freezed == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      googleRating: freezed == googleRating
          ? _value.googleRating
          : googleRating // ignore: cast_nullable_to_non_nullable
              as int?,
      restaurantUserCount: freezed == restaurantUserCount
          ? _value.restaurantUserCount
          : restaurantUserCount // ignore: cast_nullable_to_non_nullable
              as int?,
      restaurantRating: freezed == restaurantRating
          ? _value.restaurantRating
          : restaurantRating // ignore: cast_nullable_to_non_nullable
              as double?,
      isReview: freezed == isReview
          ? _value.isReview
          : isReview // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSave: freezed == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalUserCount: freezed == totalUserCount
          ? _value.totalUserCount
          : totalUserCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRating: freezed == totalRating
          ? _value.totalRating
          : totalRating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantDetailsImpl implements _RestaurantDetails {
  const _$RestaurantDetailsImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "image") final List<String>? image,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "street") this.street,
      @JsonKey(name: "state") this.state,
      @JsonKey(name: "city") this.city,
      @JsonKey(name: "country") this.country,
      @JsonKey(name: "zipcode") this.zipcode,
      @JsonKey(name: "geo_loc") this.geoLoc,
      @JsonKey(name: "lng") this.lng,
      @JsonKey(name: "lat") this.lat,
      @JsonKey(name: "landmark") this.landmark,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "place_id") this.placeId,
      @JsonKey(name: "rating") this.rating,
      @JsonKey(name: "user_ratings_total") this.userRatingsTotal,
      @JsonKey(name: "types") final List<dynamic>? types,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "google_rating") this.googleRating,
      @JsonKey(name: "restaurant_user_count") this.restaurantUserCount,
      @JsonKey(name: "restaurant_rating") this.restaurantRating,
      @JsonKey(name: "isReview") this.isReview,
      @JsonKey(name: "isSave") this.isSave,
      @JsonKey(name: "total_user_count") this.totalUserCount,
      @JsonKey(name: "total_rating") this.totalRating})
      : _image = image,
        _types = types;

  factory _$RestaurantDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantDetailsImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  final List<String>? _image;
  @override
  @JsonKey(name: "image")
  List<String>? get image {
    final value = _image;
    if (value == null) return null;
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "street")
  final String? street;
  @override
  @JsonKey(name: "state")
  final String? state;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "country")
  final String? country;
  @override
  @JsonKey(name: "zipcode")
  final String? zipcode;
  @override
  @JsonKey(name: "geo_loc")
  final GeoLoc? geoLoc;
  @override
  @JsonKey(name: "lng")
  final String? lng;
  @override
  @JsonKey(name: "lat")
  final String? lat;
  @override
  @JsonKey(name: "landmark")
  final String? landmark;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "place_id")
  final String? placeId;
  @override
  @JsonKey(name: "rating")
  final String? rating;
  @override
  @JsonKey(name: "user_ratings_total")
  final String? userRatingsTotal;
  final List<dynamic>? _types;
  @override
  @JsonKey(name: "types")
  List<dynamic>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "google_rating")
  final int? googleRating;
  @override
  @JsonKey(name: "restaurant_user_count")
  final int? restaurantUserCount;
  @override
  @JsonKey(name: "restaurant_rating")
  final double? restaurantRating;
  @override
  @JsonKey(name: "isReview")
  final bool? isReview;
  @override
  @JsonKey(name: "isSave")
  final bool? isSave;
  @override
  @JsonKey(name: "total_user_count")
  final int? totalUserCount;
  @override
  @JsonKey(name: "total_rating")
  final double? totalRating;

  @override
  String toString() {
    return 'RestaurantDetails(id: $id, image: $image, name: $name, address: $address, street: $street, state: $state, city: $city, country: $country, zipcode: $zipcode, geoLoc: $geoLoc, lng: $lng, lat: $lat, landmark: $landmark, phone: $phone, description: $description, placeId: $placeId, rating: $rating, userRatingsTotal: $userRatingsTotal, types: $types, status: $status, createdAt: $createdAt, googleRating: $googleRating, restaurantUserCount: $restaurantUserCount, restaurantRating: $restaurantRating, isReview: $isReview, isSave: $isSave, totalUserCount: $totalUserCount, totalRating: $totalRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            (identical(other.geoLoc, geoLoc) || other.geoLoc == geoLoc) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.userRatingsTotal, userRatingsTotal) ||
                other.userRatingsTotal == userRatingsTotal) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.googleRating, googleRating) ||
                other.googleRating == googleRating) &&
            (identical(other.restaurantUserCount, restaurantUserCount) ||
                other.restaurantUserCount == restaurantUserCount) &&
            (identical(other.restaurantRating, restaurantRating) ||
                other.restaurantRating == restaurantRating) &&
            (identical(other.isReview, isReview) ||
                other.isReview == isReview) &&
            (identical(other.isSave, isSave) || other.isSave == isSave) &&
            (identical(other.totalUserCount, totalUserCount) ||
                other.totalUserCount == totalUserCount) &&
            (identical(other.totalRating, totalRating) ||
                other.totalRating == totalRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(_image),
        name,
        address,
        street,
        state,
        city,
        country,
        zipcode,
        geoLoc,
        lng,
        lat,
        landmark,
        phone,
        description,
        placeId,
        rating,
        userRatingsTotal,
        const DeepCollectionEquality().hash(_types),
        status,
        createdAt,
        googleRating,
        restaurantUserCount,
        restaurantRating,
        isReview,
        isSave,
        totalUserCount,
        totalRating
      ]);

  /// Create a copy of RestaurantDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantDetailsImplCopyWith<_$RestaurantDetailsImpl> get copyWith =>
      __$$RestaurantDetailsImplCopyWithImpl<_$RestaurantDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantDetailsImplToJson(
      this,
    );
  }
}

abstract class _RestaurantDetails implements RestaurantDetails {
  const factory _RestaurantDetails(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "image") final List<String>? image,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "address") final String? address,
      @JsonKey(name: "street") final String? street,
      @JsonKey(name: "state") final String? state,
      @JsonKey(name: "city") final String? city,
      @JsonKey(name: "country") final String? country,
      @JsonKey(name: "zipcode") final String? zipcode,
      @JsonKey(name: "geo_loc") final GeoLoc? geoLoc,
      @JsonKey(name: "lng") final String? lng,
      @JsonKey(name: "lat") final String? lat,
      @JsonKey(name: "landmark") final String? landmark,
      @JsonKey(name: "phone") final String? phone,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "place_id") final String? placeId,
      @JsonKey(name: "rating") final String? rating,
      @JsonKey(name: "user_ratings_total") final String? userRatingsTotal,
      @JsonKey(name: "types") final List<dynamic>? types,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "google_rating") final int? googleRating,
      @JsonKey(name: "restaurant_user_count") final int? restaurantUserCount,
      @JsonKey(name: "restaurant_rating") final double? restaurantRating,
      @JsonKey(name: "isReview") final bool? isReview,
      @JsonKey(name: "isSave") final bool? isSave,
      @JsonKey(name: "total_user_count") final int? totalUserCount,
      @JsonKey(name: "total_rating")
      final double? totalRating}) = _$RestaurantDetailsImpl;

  factory _RestaurantDetails.fromJson(Map<String, dynamic> json) =
      _$RestaurantDetailsImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "image")
  List<String>? get image;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "street")
  String? get street;
  @override
  @JsonKey(name: "state")
  String? get state;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "country")
  String? get country;
  @override
  @JsonKey(name: "zipcode")
  String? get zipcode;
  @override
  @JsonKey(name: "geo_loc")
  GeoLoc? get geoLoc;
  @override
  @JsonKey(name: "lng")
  String? get lng;
  @override
  @JsonKey(name: "lat")
  String? get lat;
  @override
  @JsonKey(name: "landmark")
  String? get landmark;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "place_id")
  String? get placeId;
  @override
  @JsonKey(name: "rating")
  String? get rating;
  @override
  @JsonKey(name: "user_ratings_total")
  String? get userRatingsTotal;
  @override
  @JsonKey(name: "types")
  List<dynamic>? get types;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "createdAt")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "google_rating")
  int? get googleRating;
  @override
  @JsonKey(name: "restaurant_user_count")
  int? get restaurantUserCount;
  @override
  @JsonKey(name: "restaurant_rating")
  double? get restaurantRating;
  @override
  @JsonKey(name: "isReview")
  bool? get isReview;
  @override
  @JsonKey(name: "isSave")
  bool? get isSave;
  @override
  @JsonKey(name: "total_user_count")
  int? get totalUserCount;
  @override
  @JsonKey(name: "total_rating")
  double? get totalRating;

  /// Create a copy of RestaurantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantDetailsImplCopyWith<_$RestaurantDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoLoc _$GeoLocFromJson(Map<String, dynamic> json) {
  return _GeoLoc.fromJson(json);
}

/// @nodoc
mixin _$GeoLoc {
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "coordinates")
  List<double>? get coordinates => throw _privateConstructorUsedError;

  /// Serializes this GeoLoc to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeoLoc
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeoLocCopyWith<GeoLoc> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoLocCopyWith<$Res> {
  factory $GeoLocCopyWith(GeoLoc value, $Res Function(GeoLoc) then) =
      _$GeoLocCopyWithImpl<$Res, GeoLoc>;
  @useResult
  $Res call(
      {@JsonKey(name: "type") String? type,
      @JsonKey(name: "coordinates") List<double>? coordinates});
}

/// @nodoc
class _$GeoLocCopyWithImpl<$Res, $Val extends GeoLoc>
    implements $GeoLocCopyWith<$Res> {
  _$GeoLocCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeoLoc
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoLocImplCopyWith<$Res> implements $GeoLocCopyWith<$Res> {
  factory _$$GeoLocImplCopyWith(
          _$GeoLocImpl value, $Res Function(_$GeoLocImpl) then) =
      __$$GeoLocImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "type") String? type,
      @JsonKey(name: "coordinates") List<double>? coordinates});
}

/// @nodoc
class __$$GeoLocImplCopyWithImpl<$Res>
    extends _$GeoLocCopyWithImpl<$Res, _$GeoLocImpl>
    implements _$$GeoLocImplCopyWith<$Res> {
  __$$GeoLocImplCopyWithImpl(
      _$GeoLocImpl _value, $Res Function(_$GeoLocImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeoLoc
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_$GeoLocImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoLocImpl implements _GeoLoc {
  const _$GeoLocImpl(
      {@JsonKey(name: "type") this.type,
      @JsonKey(name: "coordinates") final List<double>? coordinates})
      : _coordinates = coordinates;

  factory _$GeoLocImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoLocImplFromJson(json);

  @override
  @JsonKey(name: "type")
  final String? type;
  final List<double>? _coordinates;
  @override
  @JsonKey(name: "coordinates")
  List<double>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GeoLoc(type: $type, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoLocImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_coordinates));

  /// Create a copy of GeoLoc
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoLocImplCopyWith<_$GeoLocImpl> get copyWith =>
      __$$GeoLocImplCopyWithImpl<_$GeoLocImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoLocImplToJson(
      this,
    );
  }
}

abstract class _GeoLoc implements GeoLoc {
  const factory _GeoLoc(
          {@JsonKey(name: "type") final String? type,
          @JsonKey(name: "coordinates") final List<double>? coordinates}) =
      _$GeoLocImpl;

  factory _GeoLoc.fromJson(Map<String, dynamic> json) = _$GeoLocImpl.fromJson;

  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "coordinates")
  List<double>? get coordinates;

  /// Create a copy of GeoLoc
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeoLocImplCopyWith<_$GeoLocImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
