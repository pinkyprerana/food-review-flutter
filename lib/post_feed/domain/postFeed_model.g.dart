// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postFeed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferenceModelImpl _$$PreferenceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PreferenceModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      postList: (json['data'] as List<dynamic>)
          .map((e) => DataOfPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PreferenceModelImplToJson(
        _$PreferenceModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.postList,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
    };

_$DataOfPostModelImpl _$$DataOfPostModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataOfPostModelImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      file: json['file'] as String,
      mimetype: json['mimetype'] as String,
      howWasIt: json['how_was_it'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isOwn: json['isOwn'] as bool,
      isSave: json['isSave'] as bool,
      likeCount: (json['like_count'] as num).toInt(),
      isMyLike: json['isMyLike'] as bool,
      commentCount: (json['comment_count'] as num).toInt(),
      userInfo: UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      restaurantInfo: RestaurantInfo.fromJson(
          json['restaurantInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataOfPostModelImplToJson(
        _$DataOfPostModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'file': instance.file,
      'mimetype': instance.mimetype,
      'how_was_it': instance.howWasIt,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'isOwn': instance.isOwn,
      'isSave': instance.isSave,
      'like_count': instance.likeCount,
      'isMyLike': instance.isMyLike,
      'comment_count': instance.commentCount,
      'userInfo': instance.userInfo,
      'restaurantInfo': instance.restaurantInfo,
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
