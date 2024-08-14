// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_restaurants_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllRestaurantsModelImpl _$$AllRestaurantsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllRestaurantsModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RestaurantData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AllRestaurantsModelImplToJson(
        _$AllRestaurantsModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.data,
    };

_$RestaurantDataImpl _$$RestaurantDataImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantDataImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
      rating: json['rating'] as String?,
    );

Map<String, dynamic> _$$RestaurantDataImplToJson(
        _$RestaurantDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'lng': instance.lng,
      'lat': instance.lat,
      'rating': instance.rating,
    };
