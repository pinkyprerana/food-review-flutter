// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowTypeModelImpl _$$FollowTypeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowTypeModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      usersList: (json['data'] as List<dynamic>?)
          ?.map((e) => Users.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FollowTypeModelImplToJson(
        _$FollowTypeModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.usersList,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      id: json['_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      profileImage: json['profile_image'] as String?,
      roleInfo: json['role_info'] == null
          ? null
          : RoleInfo.fromJson(json['role_info'] as Map<String, dynamic>),
      followingRequestId: json['following_request_id'],
      followerRequestId: json['follower_request_id'] as String?,
      isFollowingRequest: json['isFollowingRequest'] as bool?,
      isFollowerRequest: json['isFollowerRequest'] as bool?,
      isFollowing: json['isFollowing'] as bool?,
      isFollower: json['isFollower'] as bool?,
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fullName': instance.fullName,
      'email': instance.email,
      'profile_image': instance.profileImage,
      'role_info': instance.roleInfo,
      'following_request_id': instance.followingRequestId,
      'follower_request_id': instance.followerRequestId,
      'isFollowingRequest': instance.isFollowingRequest,
      'isFollowerRequest': instance.isFollowerRequest,
      'isFollowing': instance.isFollowing,
      'isFollower': instance.isFollower,
    };

_$RoleInfoImpl _$$RoleInfoImplFromJson(Map<String, dynamic> json) =>
    _$RoleInfoImpl(
      id: json['_id'] as String?,
      roleDisplayName: json['roleDisplayName'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$RoleInfoImplToJson(_$RoleInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'roleDisplayName': instance.roleDisplayName,
      'role': instance.role,
    };
