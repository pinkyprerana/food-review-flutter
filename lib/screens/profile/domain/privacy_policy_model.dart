// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'privacy_policy_model.freezed.dart';
part 'privacy_policy_model.g.dart';

@freezed
class PrivacyPolicyModel with _$PrivacyPolicyModel {
  const factory PrivacyPolicyModel({
    @JsonKey(name: "status")
    int? status,
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "data")
    DataOfPrivacyPolicy? data,
  }) = _PrivacyPolicyModel;

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) => _$PrivacyPolicyModelFromJson(json);
}

@freezed
class DataOfPrivacyPolicy with _$DataOfPrivacyPolicy {
  const factory DataOfPrivacyPolicy({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "slug")
    String? slug,
    @JsonKey(name: "content")
    String? content,
  }) = _DataOfPrivacyPolicy;

  factory DataOfPrivacyPolicy.fromJson(Map<String, dynamic> json) => _$DataOfPrivacyPolicyFromJson(json);
}
