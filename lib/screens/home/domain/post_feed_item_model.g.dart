// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_feed_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostFeedItemModelImpl _$$PostFeedItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PostFeedItemModelImpl(
      status: (json['status'] as num).toInt(),
      type: json['type'] as String,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostFeedItemModelImplToJson(
        _$PostFeedItemModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      file: json['file'] as String,
      mimetype: json['mimetype'] as String,
      howWasIt: json['how_was_it'] as String,
      location: json['location'] as String,
      geoLoc: GeoLoc.fromJson(json['geo_loc'] as Map<String, dynamic>),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isOwn: json['isOwn'] as bool,
      isSave: json['isSave'] as bool,
      likeCount: (json['like_count'] as num).toInt(),
      isMyLike: json['isMyLike'] as bool,
      commentCount: (json['comment_count'] as num).toInt(),
      userInfo: UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      preferenceInfo: PreferenceInfo.fromJson(
          json['preferenceInfo'] as Map<String, dynamic>),
      restaurantInfo: RestaurantInfo.fromJson(
          json['restaurantInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'file': instance.file,
      'mimetype': instance.mimetype,
      'how_was_it': instance.howWasIt,
      'location': instance.location,
      'geo_loc': instance.geoLoc,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'isOwn': instance.isOwn,
      'isSave': instance.isSave,
      'like_count': instance.likeCount,
      'isMyLike': instance.isMyLike,
      'comment_count': instance.commentCount,
      'userInfo': instance.userInfo,
      'preferenceInfo': instance.preferenceInfo,
      'restaurantInfo': instance.restaurantInfo,
    };

_$GeoLocImpl _$$GeoLocImplFromJson(Map<String, dynamic> json) => _$GeoLocImpl(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$GeoLocImplToJson(_$GeoLocImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_$PreferenceInfoImpl _$$PreferenceInfoImplFromJson(Map<String, dynamic> json) =>
    _$PreferenceInfoImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$PreferenceInfoImplToJson(
        _$PreferenceInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };

_$RestaurantInfoImpl _$$RestaurantInfoImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantInfoImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      zipcode: json['zipcode'] as String,
      userRatingsTotal: json['user_ratings_total'] as String,
      rating: json['rating'] as String,
    );

Map<String, dynamic> _$$RestaurantInfoImplToJson(
        _$RestaurantInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'state': instance.state,
      'city': instance.city,
      'country': instance.country,
      'zipcode': instance.zipcode,
      'user_ratings_total': instance.userRatingsTotal,
      'rating': instance.rating,
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      profileImage: json['profile_image'] as String,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'profile_image': instance.profileImage,
    };
