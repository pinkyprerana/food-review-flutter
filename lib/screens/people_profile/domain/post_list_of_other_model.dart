// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_list_of_other_model.freezed.dart';
part 'post_list_of_other_model.g.dart';

@freezed
abstract class PostListOfOtherModel with _$PostListOfOtherModel {
  const factory PostListOfOtherModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") required List<DataOfPostListOfOtherModel> postListOfOtherUser,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "pages") int? pages,
    @JsonKey(name: "limit") int? limit,
  }) = _PostListOfOtherModel;

  factory PostListOfOtherModel.fromJson(Map<String, dynamic> json) =>
      _$PostListOfOtherModelFromJson(json);
}

@freezed
abstract class DataOfPostListOfOtherModel with _$DataOfPostListOfOtherModel {
  const factory DataOfPostListOfOtherModel({
    @JsonKey(name: "_id")  String? id,
    @JsonKey(name: "title")  String? title,
    @JsonKey(name: "description")  String? description,
    @JsonKey(name: "file")  String? file,
    @JsonKey(name: "mimetype")  String? mimetype,
    @JsonKey(name: "how_was_it")  String? howWasIt,
    @JsonKey(name: "status")  String? status,
    @JsonKey(name: "createdAt")  DateTime? createdAt,
    @JsonKey(name: "isOwn")  bool? isOwn,
    @JsonKey(name: "isNear")  bool? isNear,
    @JsonKey(name: "isFollowing")  bool? isFollowing,
    @JsonKey(name: "isFollower")  bool? isFollower,
    @JsonKey(name: "isSave")  bool? isSave,
    @JsonKey(name: "like_count")  int? likeCount,
    @JsonKey(name: "isMyLike")  bool? isMyLike,
    @JsonKey(name: "comment_count")  int? commentCount,
    @JsonKey(name: "geo_distance")  double? geoDistance,
    @JsonKey(name: "geo_loc")  GeoLoc? geoLoc,
    @JsonKey(name: "userInfo")  UserInfo? userInfo,
    @JsonKey(name: "preferenceInfo")  PreferenceInfo? preferenceInfo,
    @JsonKey(name: "restaurantInfo")  RestaurantInfo? restaurantInfo,
  }) = _DataOfPostListOfOtherModel;

  factory DataOfPostListOfOtherModel.fromJson(Map<String, dynamic> json) =>
      _$DataOfPostListOfOtherModelFromJson(json);
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

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}

@freezed
abstract class PreferenceInfo with _$PreferenceInfo {
  const factory PreferenceInfo({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "title") required String title,
  }) = _PreferenceInfo;

  factory PreferenceInfo.fromJson(Map<String, dynamic> json) => _$PreferenceInfoFromJson(json);
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

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) => _$RestaurantInfoFromJson(json);
}
