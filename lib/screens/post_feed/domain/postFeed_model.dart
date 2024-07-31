// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'postFeed_model.freezed.dart';
part 'postFeed_model.g.dart';

@freezed
abstract class PostModel with _$PostModel {
  const factory PostModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") required List<DataOfPostModel> postList,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "pages") int? pages,
    @JsonKey(name: "limit") int? limit,
  }) = _PreferenceModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

@freezed
abstract class DataOfPostModel with _$DataOfPostModel {
  const factory DataOfPostModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "file") required String file,
    @JsonKey(name: "mimetype") required String mimetype,
    @JsonKey(name: "how_was_it") required String howWasIt,
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "isOwn") required bool isOwn,
    @JsonKey(name: "isSave") required bool isSave,
    @JsonKey(name: "like_count") required int likeCount,
    @JsonKey(name: "isMyLike") required bool isMyLike,
    @JsonKey(name: "comment_count") required int commentCount,
    @JsonKey(name: "geo_loc") required GeoLoc geoLoc,
    @JsonKey(name: "userInfo") required UserInfo userInfo,
    @JsonKey(name: "preferenceInfo") required PreferenceInfo? preferenceInfo,
    @JsonKey(name: "restaurantInfo") required RestaurantInfo restaurantInfo,
  }) = _DataOfPostModel;

  factory DataOfPostModel.fromJson(Map<String, dynamic> json) =>
      _$DataOfPostModelFromJson(json);
}

@freezed
abstract class GeoLoc with _$GeoLoc {
  const factory GeoLoc({
    @JsonKey(name: "type") required String type,
    @JsonKey(name: "coordinates") required List<double> coordinates,
  }) = _GeoLoc;

  factory GeoLoc.fromJson(Map<String, dynamic> json) => _$GeoLocFromJson(json);
}

@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "fullName") required String fullName,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "profile_image") required String profileImage,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@freezed
abstract class PreferenceInfo with _$PreferenceInfo {
  const factory PreferenceInfo({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "title") required String title,
  }) = _PreferenceInfo;

  factory PreferenceInfo.fromJson(Map<String, dynamic> json) =>
      _$PreferenceInfoFromJson(json);
}

@freezed
abstract class RestaurantInfo with _$RestaurantInfo {
  const factory RestaurantInfo({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "state") required String state,
    @JsonKey(name: "city") required String city,
    @JsonKey(name: "country") required String country,
    @JsonKey(name: "zipcode") required String zipcode,
    @JsonKey(name: "user_ratings_total") required String userRatingsTotal,
    @JsonKey(name: "rating") required String rating,
  }) = _RestaurantInfo;

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) =>
      _$RestaurantInfoFromJson(json);
}
