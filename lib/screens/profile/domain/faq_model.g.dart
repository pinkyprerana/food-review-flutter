// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqModelImpl _$$FaqModelImplFromJson(Map<String, dynamic> json) =>
    _$FaqModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      faqList: (json['data'] as List<dynamic>?)
          ?.map((e) => DataOfFQA.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FaqModelImplToJson(_$FaqModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.faqList,
    };

_$DataOfFQAImpl _$$DataOfFQAImplFromJson(Map<String, dynamic> json) =>
    _$DataOfFQAImpl(
      id: json['_id'] as String?,
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$DataOfFQAImplToJson(_$DataOfFQAImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'createdAt': instance.createdAt,
    };
