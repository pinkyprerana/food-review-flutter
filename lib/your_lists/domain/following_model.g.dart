// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingModelImpl _$$FollowingModelImplFromJson(Map<String, dynamic> json) =>
    _$FollowingModelImpl(
      status: (json['status'] as num).toInt(),
      type: json['type'] as String,
      message: json['message'] as String,
      followingList: (json['data'] as List<dynamic>)
          .map((e) => DataOfFollowingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$$FollowingModelImplToJson(
        _$FollowingModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.followingList,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
    };

_$DataOfFollowingModelImpl _$$DataOfFollowingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataOfFollowingModelImpl(
      id: json['_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      fullName: json['fullName'] as String?,
      email: json['email'] as String,
      profileImage: json['profile_image'] as String,
      roleInfoOfFollowing: RoleInfoOfFollowing.fromJson(
          json['role_info'] as Map<String, dynamic>),
      requestId: json['request_id'],
      isRequest: json['isRequest'] as bool,
      isFollow: json['isFollow'] as bool,
    );

Map<String, dynamic> _$$DataOfFollowingModelImplToJson(
        _$DataOfFollowingModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fullName': instance.fullName,
      'email': instance.email,
      'profile_image': instance.profileImage,
      'role_info': instance.roleInfoOfFollowing,
      'request_id': instance.requestId,
      'isRequest': instance.isRequest,
      'isFollow': instance.isFollow,
    };

_$RoleInfoOfFollowingImpl _$$RoleInfoOfFollowingImplFromJson(
        Map<String, dynamic> json) =>
    _$RoleInfoOfFollowingImpl(
      id: json['_id'] as String,
      roleDisplayName: json['roleDisplayName'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$RoleInfoOfFollowingImplToJson(
        _$RoleInfoOfFollowingImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'roleDisplayName': instance.roleDisplayName,
      'role': instance.role,
    };
