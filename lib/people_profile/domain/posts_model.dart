// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'posts_model.freezed.dart';
// part 'posts_model.g.dart';
//
// @freezed
// class PostModel with $_PostModel{
//   const factory PostModel({
//     @JsonKey(name: "status") int? status,
//     @JsonKey(name: "type") String? type,
//     @JsonKey(name: "message") String? message,
//     @JsonKey(name: "data") List<PostList>? postList,
//   }) = _PreferenceModel;
//
//   factory PostModel.fromJson(Map<String, dynamic> json) =>
//       _$PostModelFromJson(json);
// }
//
//
// @freezed
// class PostList with $_PostList {
//   const factory PostList({
//     @JsonKey(name: "_id") required String id,
//     @JsonKey(name: "title") required String title,
//   }) = _PostList;
//
//   factory PostList.fromJson(Map<String, dynamic> json) =>
//       _$PostListFromJson(json);
// }