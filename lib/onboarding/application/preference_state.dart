// // ignore: depend_on_referenced_packages
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'preference_state.freezed.dart';
//
// @freezed
// abstract class PreferenceState with _$PreferenceState {
//   const factory PreferenceState({
//     @Default(0) int status,
//     @Default('') String type,
//     @Default('') String message,
//     @Default([]) List<PreferenceList> data,
//   }) = _PreferenceState;
//
//   factory PreferenceState.initial() => PreferenceState();
//
//   factory PreferenceState.fromJson(Map<String, dynamic> json) => PreferenceState(
//     status: json["status"],
//     type: json["type"],
//     message: json["message"],
//     data: List<PreferenceList>.from(json["data"].map((x) => PreferenceList.fromJson(x))),
//   );
// }
//
// @freezed
// abstract class PreferenceList with _$PreferenceList {
//   const factory PreferenceList({
//     @Default('') String id,
//     @Default('') String title,
//     @Default('') String status,
//   }) = _PreferenceList;
//
//   factory PreferenceList.fromJson(Map<String, dynamic> json) => PreferenceList(
//     id: json["_id"],
//     title: json["title"],
//     status: json["status"],
//   );
// }
