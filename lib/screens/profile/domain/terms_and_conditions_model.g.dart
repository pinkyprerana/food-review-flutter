// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_conditions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TermsAndConditionsModelImpl _$$TermsAndConditionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TermsAndConditionsModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataOfTermsAndConditions.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TermsAndConditionsModelImplToJson(
        _$TermsAndConditionsModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.data,
    };

_$DataOfTermsAndConditionsImpl _$$DataOfTermsAndConditionsImplFromJson(
        Map<String, dynamic> json) =>
    _$DataOfTermsAndConditionsImpl(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$DataOfTermsAndConditionsImplToJson(
        _$DataOfTermsAndConditionsImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'content': instance.content,
    };
