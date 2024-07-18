// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowRequestModelImpl _$$FollowRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowRequestModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      requestsList: (json['data'] as List<dynamic>?)
          ?.map((e) => FollowRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FollowRequestModelImplToJson(
        _$FollowRequestModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.requestsList,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
    };

_$FollowRequestImpl _$$FollowRequestImplFromJson(Map<String, dynamic> json) =>
    _$FollowRequestImpl(
      id: json['_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      profileImage: json['profile_image'] as String?,
      roleInfo: json['role_info'] == null
          ? null
          : RoleInfo.fromJson(json['role_info'] as Map<String, dynamic>),
      requestId: json['request_id'] as String?,
      isRequest: json['isRequest'] as bool?,
      isFollow: json['isFollow'] as bool?,
    );

Map<String, dynamic> _$$FollowRequestImplToJson(_$FollowRequestImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fullName': instance.fullName,
      'email': instance.email,
      'profile_image': instance.profileImage,
      'role_info': instance.roleInfo,
      'request_id': instance.requestId,
      'isRequest': instance.isRequest,
      'isFollow': instance.isFollow,
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
