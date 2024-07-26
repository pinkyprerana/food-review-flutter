// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postFeed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      postList: (json['data'] as List<dynamic>?)
          ?.map((e) => DataOfPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
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
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      file: json['file'] as String?,
      mimetype: json['mimetype'] as String?,
      howWasIt: json['how_was_it'] as String?,
      location: json['location'] as String?,
      geoDistance: (json['geo_distance'] as num?)?.toDouble(),
      geoLoc: json['geo_loc'] == null
          ? null
          : GeoLoc.fromJson(json['geo_loc'] as Map<String, dynamic>),
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      isOwn: json['isOwn'] as bool?,
      isNear: json['isNear'] as bool?,
      isFollowing: json['isFollowing'] as bool?,
      isFollower: json['isFollower'] as bool?,
      isSave: json['isSave'] as bool?,
      likeCount: (json['like_count'] as num?)?.toInt(),
      isMyLike: json['isMyLike'] as bool?,
      isMyDisLike: json['isMyDisLike'] as bool?,
      commentCount: (json['comment_count'] as num?)?.toInt(),
      userInfo: json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      commentInfo: (json['commentInfo'] as List<dynamic>?)
          ?.map((e) => CommentInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      restaurantInfo: json['restaurantInfo'] == null
          ? null
          : RestaurantInfo.fromJson(
              json['restaurantInfo'] as Map<String, dynamic>),
      preferenceInfo: json['preferenceInfo'] == null
          ? null
          : PreferenceInfo.fromJson(
              json['preferenceInfo'] as Map<String, dynamic>),
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
      'location': instance.location,
      'geo_distance': instance.geoDistance,
      'geo_loc': instance.geoLoc,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'isOwn': instance.isOwn,
      'isNear': instance.isNear,
      'isFollowing': instance.isFollowing,
      'isFollower': instance.isFollower,
      'isSave': instance.isSave,
      'like_count': instance.likeCount,
      'isMyLike': instance.isMyLike,
      'isMyDisLike': instance.isMyDisLike,
      'comment_count': instance.commentCount,
      'userInfo': instance.userInfo,
      'commentInfo': instance.commentInfo,
      'restaurantInfo': instance.restaurantInfo,
      'preferenceInfo': instance.preferenceInfo,
    };

_$CommentInfoImpl _$$CommentInfoImplFromJson(Map<String, dynamic> json) =>
    _$CommentInfoImpl(
      id: json['_id'] as String?,
      userId: json['user_id'] as String?,
      postId: json['post_id'] as String?,
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] as String?,
      commentedUserData: json['commentedUserData'] == null
          ? null
          : UserInfo.fromJson(
              json['commentedUserData'] as Map<String, dynamic>),
      isCommentLiked: json['isCommentLiked'] as bool?,
    );

Map<String, dynamic> _$$CommentInfoImplToJson(_$CommentInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'post_id': instance.postId,
      'comment': instance.comment,
      'createdAt': instance.createdAt,
      'commentedUserData': instance.commentedUserData,
      'isCommentLiked': instance.isCommentLiked,
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'profile_image': instance.profileImage,
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

_$RestaurantInfoImpl _$$RestaurantInfoImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantInfoImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      zipcode: json['zipcode'] as String?,
      userRatingsTotal: json['user_ratings_total'] as String?,
      rating: json['rating'] as String?,
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

_$PreferenceInfoImpl _$$PreferenceInfoImplFromJson(Map<String, dynamic> json) =>
    _$PreferenceInfoImpl(
      id: json['_id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$PreferenceInfoImplToJson(
        _$PreferenceInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };
