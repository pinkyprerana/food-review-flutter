// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_restaurants_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedRestaurantsResponseModelImpl
    _$$SavedRestaurantsResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$SavedRestaurantsResponseModelImpl(
          status: (json['status'] as num?)?.toInt(),
          type: json['type'] as String?,
          message: json['message'] as String?,
          savedRestaurantList: (json['data'] as List<dynamic>?)
              ?.map((e) => SavedRestaurant.fromJson(e as Map<String, dynamic>))
              .toList(),
          total: (json['total'] as num?)?.toInt(),
          page: (json['page'] as num?)?.toInt(),
          pages: (json['pages'] as num?)?.toInt(),
          limit: (json['limit'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$SavedRestaurantsResponseModelImplToJson(
        _$SavedRestaurantsResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.savedRestaurantList,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
    };

_$SavedRestaurantImpl _$$SavedRestaurantImplFromJson(
        Map<String, dynamic> json) =>
    _$SavedRestaurantImpl(
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
      isSave: json['isSave'] as bool?,
    );

Map<String, dynamic> _$$SavedRestaurantImplToJson(
        _$SavedRestaurantImpl instance) =>
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
      'isSave': instance.isSave,
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
