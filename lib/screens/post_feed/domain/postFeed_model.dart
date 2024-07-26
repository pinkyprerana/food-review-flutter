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
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
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
    @JsonKey(name: "location") required String location,
    @JsonKey(name: "geo_distance") required double geoDistance,
    @JsonKey(name: "geo_loc") required GeoLocation geoLoc,
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "isOwn") required bool isOwn,
    @JsonKey(name: "isNear") required bool isNear,
    @JsonKey(name: "isFollowing") required bool isFollowing,
    @JsonKey(name: "isFollower") required bool isFollower,
    @JsonKey(name: "isSave") required bool isSave,
    @JsonKey(name: "like_count") required int likeCount,
    @JsonKey(name: "isMyLike") required bool isMyLike,
    @JsonKey(name: "isMyDisLike") required bool isMyDisLike,
    @JsonKey(name: "comment_count") required int commentCount,
    @JsonKey(name: "userInfo") required UserInfo userInfo,
    @JsonKey(name: "commentInfo") required List<CommentInfo> commentInfo,
    @JsonKey(name: "preferenceInfo") required PreferenceInfo preferenceInfo,
    @JsonKey(name: "restaurantInfo") required RestaurantInfo? restaurantInfo,
  }) = _DataOfPostModel;

  factory DataOfPostModel.fromJson(Map<String, dynamic> json) => _$DataOfPostModelFromJson(json);
}

@freezed
abstract class GeoLocation with _$GeoLocation {
  const factory GeoLocation({
    @JsonKey(name: "type") required String type,
    @JsonKey(name: "coordinates") required List<double> coordinates,
  }) = _GeoLocation;

  factory GeoLocation.fromJson(Map<String, dynamic> json) => _$GeoLocationFromJson(json);
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
abstract class CommentInfo with _$CommentInfo {
  const factory CommentInfo({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "user_id") required String userId,
    @JsonKey(name: "post_id") required String postId,
    @JsonKey(name: "comment") required String comment,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "commentedUserData") required CommentedUserData commentedUserData,
    @JsonKey(name: "isCommentLiked") required bool isCommentLiked,
  }) = _CommentInfo;

  factory CommentInfo.fromJson(Map<String, dynamic> json) => _$CommentInfoFromJson(json);
}

@freezed
abstract class CommentedUserData with _$CommentedUserData {
  const factory CommentedUserData({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "fullName") required String fullName,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "profile_image") required String profileImage,
  }) = _CommentedUserData;

  factory CommentedUserData.fromJson(Map<String, dynamic> json) =>
      _$CommentedUserDataFromJson(json);
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
