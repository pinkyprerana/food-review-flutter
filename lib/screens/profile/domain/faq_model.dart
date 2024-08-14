// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

@freezed
class FaqModel with _$FaqModel {
  const factory FaqModel({
    @JsonKey(name: "status")
    int? status,
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "data")
    List<DataOfFQA>? faqList,
  }) = _FaqModel;

  factory FaqModel.fromJson(Map<String, dynamic> json) => _$FaqModelFromJson(json);
}

@freezed
class DataOfFQA with _$DataOfFQA {
  const factory DataOfFQA({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "question")
    String? question,
    @JsonKey(name: "answer")
    String? answer,
    @JsonKey(name: "createdAt")
    String? createdAt,
  }) = _DataOfFQA;

  factory DataOfFQA.fromJson(Map<String, dynamic> json) => _$DataOfFQAFromJson(json);
}
