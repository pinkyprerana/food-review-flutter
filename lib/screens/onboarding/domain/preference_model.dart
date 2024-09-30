// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'preference_model.freezed.dart';
part 'preference_model.g.dart';

@freezed
class PreferenceModel with _$PreferenceModel {
  const factory PreferenceModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<PreferenceList>? data,
  }) = _PreferenceModel;

  factory PreferenceModel.fromJson(Map<String, dynamic> json) => _$PreferenceModelFromJson(json);
}

@freezed
class PreferenceList with _$PreferenceList {
  const factory PreferenceList({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "status") String? status,
  }) = _PreferenceList;

  factory PreferenceList.fromJson(Map<String, dynamic> json) => _$PreferenceListFromJson(json);
}
