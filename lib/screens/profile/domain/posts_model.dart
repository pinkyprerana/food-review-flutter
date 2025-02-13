// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_model.freezed.dart';
part 'posts_model.g.dart';

@freezed
class PostsModel with _$PostsModel {
  const factory PostsModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<Posts>? postsList,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "pages") int? pages,
    @JsonKey(name: "limit") int? limit,
  }) = _PostsModel;

  factory PostsModel.fromJson(Map<String, dynamic> json) => _$PostsModelFromJson(json);
}

@freezed
class Posts with _$Posts {
  const factory Posts({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "file") String? file,
    @JsonKey(name: "mimetype") String? mimetype,
    @JsonKey(name: "how_was_it") String? howWasIt,
    @JsonKey(name: "location") String? location,
    @JsonKey(name: "geo_distance") double? geoDistance,
    @JsonKey(name: "geo_loc") GeoLoc? geoLoc,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "createdAt") String? createdAt,
    @JsonKey(name: "isOwn") bool? isOwn,
    @JsonKey(name: "isNear") bool? isNear,
    @JsonKey(name: "isFollowing") bool? isFollowing,
    @JsonKey(name: "isFollowingRequest") bool? isFollowingRequest,
    @JsonKey(name: "isFollower") bool? isFollower,
    @JsonKey(name: "isSave") bool? isSave,
    @JsonKey(name: "like_count") int? likeCount,
    @JsonKey(name: "isMyLike") bool? isMyLike,
    @JsonKey(name: "isMyDisLike") bool? isMyDisLike,
    @JsonKey(name: "comment_count") int? commentCount,
    @JsonKey(name: "userInfo") UserInfo? userInfo,
    @JsonKey(name: "preferenceInfo") PreferenceInfo? preferenceInfo,
    @JsonKey(name: "restaurantInfo") RestaurantInfo? restaurantInfo,
  }) = _Posts;

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
}

@freezed
class GeoLoc with _$GeoLoc {
  const factory GeoLoc({
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "coordinates") List<double>? coordinates,
  }) = _GeoLoc;

  factory GeoLoc.fromJson(Map<String, dynamic> json) => _$GeoLocFromJson(json);
}

@freezed
class PreferenceInfo with _$PreferenceInfo {
  const factory PreferenceInfo({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "title") String? title,
  }) = _PreferenceInfo;

  factory PreferenceInfo.fromJson(Map<String, dynamic> json) => _$PreferenceInfoFromJson(json);
}

@freezed
class RestaurantInfo with _$RestaurantInfo {
  const factory RestaurantInfo({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "zipcode") String? zipcode,
    @JsonKey(name: "user_ratings_total") String? userRatingsTotal,
    @JsonKey(name: "rating") String? rating,
  }) = _RestaurantInfo;

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) => _$RestaurantInfoFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "fullName") String? fullName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "profile_image") String? profileImage,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}
