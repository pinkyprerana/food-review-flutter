// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardDetailsModelImpl _$$LeaderboardDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardDetailsModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LeaderboardDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LeaderboardDetailsModelImplToJson(
        _$LeaderboardDetailsModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
    };

_$LeaderboardDetailImpl _$$LeaderboardDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardDetailImpl(
      id: json['_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      profileImage: json['profile_image'] as String?,
      roleInfo: json['role_info'] == null
          ? null
          : RoleInfo.fromJson(json['role_info'] as Map<String, dynamic>),
      location: json['location'] as String?,
      city: json['city'] as String?,
      point: (json['point'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LeaderboardDetailImplToJson(
        _$LeaderboardDetailImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fullName': instance.fullName,
      'email': instance.email,
      'profile_image': instance.profileImage,
      'role_info': instance.roleInfo,
      'location': instance.location,
      'city': instance.city,
      'point': instance.point,
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
