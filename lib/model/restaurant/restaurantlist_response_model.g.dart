// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurantlist_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantlistResponseModelImpl _$$RestaurantlistResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantlistResponseModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      restaurantList: (json['data'] as List<dynamic>?)
          ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RestaurantlistResponseModelImplToJson(
        _$RestaurantlistResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.restaurantList,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
    };

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      id: json['_id'] as String?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      address: json['address'] as String?,
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
      userRatingsTotal: json['user_ratings_total'] as String?,
      rating: json['rating'] as String?,
      status: json['status'] as String?,
      street: json['street'] as String?,
      placeId: json['place_id'] as String?,
      isSave: json['isSave'] as bool?,
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'address': instance.address,
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
      'user_ratings_total': instance.userRatingsTotal,
      'rating': instance.rating,
      'status': instance.status,
      'street': instance.street,
      'place_id': instance.placeId,
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
