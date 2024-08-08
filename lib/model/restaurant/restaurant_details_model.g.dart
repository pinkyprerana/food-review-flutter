// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantDetailsModelImpl _$$RestaurantDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantDetailsModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      restaurantDetails: json['data'] == null
          ? null
          : RestaurantDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RestaurantDetailsModelImplToJson(
        _$RestaurantDetailsModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.restaurantDetails,
    };

_$RestaurantDetailsImpl _$$RestaurantDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantDetailsImpl(
      id: json['_id'] as String?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      address: json['address'] as String?,
      street: json['street'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      zipcode: json['zipcode'] as String?,
      geoLoc: json['geo_loc'] == null
          ? null
          : GeoLoc.fromJson(json['geo_loc'] as Map<String, dynamic>),
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
      landmark: json['landmark'] as String?,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
      placeId: json['place_id'] as String?,
      rating: json['rating'] as String?,
      userRatingsTotal: json['user_ratings_total'] as String?,
      types: json['types'] as List<dynamic>?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      googleRating: (json['google_rating'] as num?)?.toInt(),
      restaurantUserCount: (json['restaurant_user_count'] as num?)?.toInt(),
      restaurantRating: (json['restaurant_rating'] as num?)?.toDouble(),
      isReview: json['isReview'] as bool?,
      isSave: json['isSave'] as bool?,
      totalUserCount: (json['total_user_count'] as num?)?.toInt(),
      totalRating: (json['total_rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RestaurantDetailsImplToJson(
        _$RestaurantDetailsImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'address': instance.address,
      'street': instance.street,
      'state': instance.state,
      'city': instance.city,
      'country': instance.country,
      'zipcode': instance.zipcode,
      'geo_loc': instance.geoLoc,
      'lng': instance.lng,
      'lat': instance.lat,
      'landmark': instance.landmark,
      'phone': instance.phone,
      'description': instance.description,
      'place_id': instance.placeId,
      'rating': instance.rating,
      'user_ratings_total': instance.userRatingsTotal,
      'types': instance.types,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'google_rating': instance.googleRating,
      'restaurant_user_count': instance.restaurantUserCount,
      'restaurant_rating': instance.restaurantRating,
      'isReview': instance.isReview,
      'isSave': instance.isSave,
      'total_user_count': instance.totalUserCount,
      'total_rating': instance.totalRating,
    };

_$GeoLocImpl _$$GeoLocImplFromJson(Map<String, dynamic> json) => _$GeoLocImpl(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$GeoLocImplToJson(_$GeoLocImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
