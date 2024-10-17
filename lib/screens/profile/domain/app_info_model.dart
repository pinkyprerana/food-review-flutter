// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_info_model.freezed.dart';
part 'app_info_model.g.dart';

@freezed
class AppInfoModel with _$AppInfoModel {
  const factory AppInfoModel({
    @JsonKey(name: "status")
    int? status,
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "data")
    AppInfoData? data,
  }) = _AppInfoModel;

  factory AppInfoModel.fromJson(Map<String, dynamic> json) => _$AppInfoModelFromJson(json);
}

@freezed
class AppInfoData with _$AppInfoData {
  const factory AppInfoData({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "slug")
    String? slug,
    @JsonKey(name: "content")
    String? content,
  }) = _AppInfoData;

  factory AppInfoData.fromJson(Map<String, dynamic> json) => _$AppInfoDataFromJson(json);
}
