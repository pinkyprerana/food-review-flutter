// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppInfoModelImpl _$$AppInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$AppInfoModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AppInfoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppInfoModelImplToJson(_$AppInfoModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.data,
    };

_$AppInfoDataImpl _$$AppInfoDataImplFromJson(Map<String, dynamic> json) =>
    _$AppInfoDataImpl(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$AppInfoDataImplToJson(_$AppInfoDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'content': instance.content,
    };
