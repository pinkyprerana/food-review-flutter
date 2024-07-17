// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferenceModelImpl _$$PreferenceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PreferenceModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PreferenceList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PreferenceModelImplToJson(
        _$PreferenceModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.data,
    };

_$PreferenceListImpl _$$PreferenceListImplFromJson(Map<String, dynamic> json) =>
    _$PreferenceListImpl(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$PreferenceListImplToJson(
        _$PreferenceListImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'status': instance.status,
    };
