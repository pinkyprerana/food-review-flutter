// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurantlist_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestaurantlistResponseModel _$RestaurantlistResponseModelFromJson(
    Map<String, dynamic> json) {
  return _RestaurantlistResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurantlistResponseModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<Restaurant>? get restaurantList => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "pages")
  int? get pages => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantlistResponseModelCopyWith<RestaurantlistResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantlistResponseModelCopyWith<$Res> {
  factory $RestaurantlistResponseModelCopyWith(
          RestaurantlistResponseModel value,
          $Res Function(RestaurantlistResponseModel) then) =
      _$RestaurantlistResponseModelCopyWithImpl<$Res,
          RestaurantlistResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<Restaurant>? restaurantList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$RestaurantlistResponseModelCopyWithImpl<$Res,
        $Val extends RestaurantlistResponseModel>
    implements $RestaurantlistResponseModelCopyWith<$Res> {
  _$RestaurantlistResponseModelCopyWithImpl(this._value, this._then);

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
    Object? restaurantList = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? limit = freezed,
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
      restaurantList: freezed == restaurantList
          ? _value.restaurantList
          : restaurantList // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantlistResponseModelImplCopyWith<$Res>
    implements $RestaurantlistResponseModelCopyWith<$Res> {
  factory _$$RestaurantlistResponseModelImplCopyWith(
          _$RestaurantlistResponseModelImpl value,
          $Res Function(_$RestaurantlistResponseModelImpl) then) =
      __$$RestaurantlistResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<Restaurant>? restaurantList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$RestaurantlistResponseModelImplCopyWithImpl<$Res>
    extends _$RestaurantlistResponseModelCopyWithImpl<$Res,
        _$RestaurantlistResponseModelImpl>
    implements _$$RestaurantlistResponseModelImplCopyWith<$Res> {
  __$$RestaurantlistResponseModelImplCopyWithImpl(
      _$RestaurantlistResponseModelImpl _value,
      $Res Function(_$RestaurantlistResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? restaurantList = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$RestaurantlistResponseModelImpl(
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
      restaurantList: freezed == restaurantList
          ? _value._restaurantList
          : restaurantList // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantlistResponseModelImpl
    implements _RestaurantlistResponseModel {
  const _$RestaurantlistResponseModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") final List<Restaurant>? restaurantList,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "pages") this.pages,
      @JsonKey(name: "limit") this.limit})
      : _restaurantList = restaurantList;

  factory _$RestaurantlistResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RestaurantlistResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<Restaurant>? _restaurantList;
  @override
  @JsonKey(name: "data")
  List<Restaurant>? get restaurantList {
    final value = _restaurantList;
    if (value == null) return null;
    if (_restaurantList is EqualUnmodifiableListView) return _restaurantList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "total")
  final int? total;
  @override
  @JsonKey(name: "page")
  final int? page;
  @override
  @JsonKey(name: "pages")
  final int? pages;
  @override
  @JsonKey(name: "limit")
  final int? limit;

  @override
  String toString() {
    return 'RestaurantlistResponseModel(status: $status, type: $type, message: $message, restaurantList: $restaurantList, total: $total, page: $page, pages: $pages, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantlistResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._restaurantList, _restaurantList) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      type,
      message,
      const DeepCollectionEquality().hash(_restaurantList),
      total,
      page,
      pages,
      limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantlistResponseModelImplCopyWith<_$RestaurantlistResponseModelImpl>
      get copyWith => __$$RestaurantlistResponseModelImplCopyWithImpl<
          _$RestaurantlistResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantlistResponseModelImplToJson(
      this,
    );
  }
}

abstract class _RestaurantlistResponseModel
    implements RestaurantlistResponseModel {
  const factory _RestaurantlistResponseModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final List<Restaurant>? restaurantList,
          @JsonKey(name: "total") final int? total,
          @JsonKey(name: "page") final int? page,
          @JsonKey(name: "pages") final int? pages,
          @JsonKey(name: "limit") final int? limit}) =
      _$RestaurantlistResponseModelImpl;

  factory _RestaurantlistResponseModel.fromJson(Map<String, dynamic> json) =
      _$RestaurantlistResponseModelImpl.fromJson;

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
  List<Restaurant>? get restaurantList;
  @override
  @JsonKey(name: "total")
  int? get total;
  @override
  @JsonKey(name: "page")
  int? get page;
  @override
  @JsonKey(name: "pages")
  int? get pages;
  @override
  @JsonKey(name: "limit")
  int? get limit;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantlistResponseModelImplCopyWith<_$RestaurantlistResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  List<String>? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
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
  @JsonKey(name: "user_ratings_total")
  String? get userRatingsTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "total_rating")
  double? get totalRating => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  String? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "street")
  String? get street => throw _privateConstructorUsedError;
  @JsonKey(name: "place_id")
  String? get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: "isSave")
  bool? get isSave => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res, Restaurant>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "image") List<String>? image,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "address") String? address,
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
      @JsonKey(name: "user_ratings_total") String? userRatingsTotal,
      @JsonKey(name: "total_rating") double? totalRating,
      @JsonKey(name: "rating") String? rating,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "street") String? street,
      @JsonKey(name: "place_id") String? placeId,
      @JsonKey(name: "isSave") bool? isSave});

  $GeoLocCopyWith<$Res>? get geoLoc;
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? address = freezed,
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
    Object? userRatingsTotal = freezed,
    Object? totalRating = freezed,
    Object? rating = freezed,
    Object? status = freezed,
    Object? street = freezed,
    Object? placeId = freezed,
    Object? isSave = freezed,
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
      userRatingsTotal: freezed == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      totalRating: freezed == totalRating
          ? _value.totalRating
          : totalRating // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      isSave: freezed == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

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
abstract class _$$RestaurantImplCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$RestaurantImplCopyWith(
          _$RestaurantImpl value, $Res Function(_$RestaurantImpl) then) =
      __$$RestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "image") List<String>? image,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "address") String? address,
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
      @JsonKey(name: "user_ratings_total") String? userRatingsTotal,
      @JsonKey(name: "total_rating") double? totalRating,
      @JsonKey(name: "rating") String? rating,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "street") String? street,
      @JsonKey(name: "place_id") String? placeId,
      @JsonKey(name: "isSave") bool? isSave});

  @override
  $GeoLocCopyWith<$Res>? get geoLoc;
}

/// @nodoc
class __$$RestaurantImplCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$RestaurantImpl>
    implements _$$RestaurantImplCopyWith<$Res> {
  __$$RestaurantImplCopyWithImpl(
      _$RestaurantImpl _value, $Res Function(_$RestaurantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? address = freezed,
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
    Object? userRatingsTotal = freezed,
    Object? totalRating = freezed,
    Object? rating = freezed,
    Object? status = freezed,
    Object? street = freezed,
    Object? placeId = freezed,
    Object? isSave = freezed,
  }) {
    return _then(_$RestaurantImpl(
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
      userRatingsTotal: freezed == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      totalRating: freezed == totalRating
          ? _value.totalRating
          : totalRating // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      isSave: freezed == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantImpl implements _Restaurant {
  const _$RestaurantImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "image") final List<String>? image,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "address") this.address,
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
      @JsonKey(name: "user_ratings_total") this.userRatingsTotal,
      @JsonKey(name: "total_rating") this.totalRating,
      @JsonKey(name: "rating") this.rating,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "street") this.street,
      @JsonKey(name: "place_id") this.placeId,
      @JsonKey(name: "isSave") this.isSave})
      : _image = image;

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

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
  @JsonKey(name: "user_ratings_total")
  final String? userRatingsTotal;
  @override
  @JsonKey(name: "total_rating")
  final double? totalRating;
  @override
  @JsonKey(name: "rating")
  final String? rating;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "street")
  final String? street;
  @override
  @JsonKey(name: "place_id")
  final String? placeId;
  @override
  @JsonKey(name: "isSave")
  final bool? isSave;

  @override
  String toString() {
    return 'Restaurant(id: $id, image: $image, name: $name, address: $address, state: $state, city: $city, country: $country, zipcode: $zipcode, geoLoc: $geoLoc, lng: $lng, lat: $lat, landmark: $landmark, phone: $phone, description: $description, userRatingsTotal: $userRatingsTotal, totalRating: $totalRating, rating: $rating, status: $status, street: $street, placeId: $placeId, isSave: $isSave)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
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
            (identical(other.userRatingsTotal, userRatingsTotal) ||
                other.userRatingsTotal == userRatingsTotal) &&
            (identical(other.totalRating, totalRating) ||
                other.totalRating == totalRating) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.isSave, isSave) || other.isSave == isSave));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(_image),
        name,
        address,
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
        userRatingsTotal,
        totalRating,
        rating,
        status,
        street,
        placeId,
        isSave
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      __$$RestaurantImplCopyWithImpl<_$RestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantImplToJson(
      this,
    );
  }
}

abstract class _Restaurant implements Restaurant {
  const factory _Restaurant(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "image") final List<String>? image,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "address") final String? address,
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
      @JsonKey(name: "user_ratings_total") final String? userRatingsTotal,
      @JsonKey(name: "total_rating") final double? totalRating,
      @JsonKey(name: "rating") final String? rating,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "street") final String? street,
      @JsonKey(name: "place_id") final String? placeId,
      @JsonKey(name: "isSave") final bool? isSave}) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

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
  @JsonKey(name: "user_ratings_total")
  String? get userRatingsTotal;
  @override
  @JsonKey(name: "total_rating")
  double? get totalRating;
  @override
  @JsonKey(name: "rating")
  String? get rating;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "street")
  String? get street;
  @override
  @JsonKey(name: "place_id")
  String? get placeId;
  @override
  @JsonKey(name: "isSave")
  bool? get isSave;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
  _$$GeoLocImplCopyWith<_$GeoLocImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
