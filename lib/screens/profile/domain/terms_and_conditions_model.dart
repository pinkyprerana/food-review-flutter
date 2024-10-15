// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'terms_and_conditions_model.freezed.dart';
part 'terms_and_conditions_model.g.dart';

@freezed
class TermsAndConditionsModel with _$TermsAndConditionsModel {
  const factory TermsAndConditionsModel({
    @JsonKey(name: "status")
    int? status,
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "data")
    DataOfTermsAndConditions? data,
  }) = _TermsAndConditionsModel;

  factory TermsAndConditionsModel.fromJson(Map<String, dynamic> json) => _$TermsAndConditionsModelFromJson(json);
}

@freezed
class DataOfTermsAndConditions with _$DataOfTermsAndConditions {
  const factory DataOfTermsAndConditions({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "slug")
    String? slug,
    @JsonKey(name: "content")
    String? content,
  }) = _DataOfTermsAndConditions;

  factory DataOfTermsAndConditions.fromJson(Map<String, dynamic> json) => _$DataOfTermsAndConditionsFromJson(json);
}
