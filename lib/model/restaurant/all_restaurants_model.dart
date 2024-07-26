// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_restaurants_model.freezed.dart';
part 'all_restaurants_model.g.dart';

@freezed
class AllRestaurantsModel with _$AllRestaurantsModel {
  const factory AllRestaurantsModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<RestaurantData>? data,
  }) = _AllRestaurantsModel;

  factory AllRestaurantsModel.fromJson(Map<String, dynamic> json) =>
      _$AllRestaurantsModelFromJson(json);
}

@freezed
class RestaurantData with _$RestaurantData {
  const factory RestaurantData({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "lng") String? lng,
    @JsonKey(name: "lat") String? lat,
    @JsonKey(name: "rating") String? rating,
  }) = _RestaurantData;

  factory RestaurantData.fromJson(Map<String, dynamic> json) => _$RestaurantDataFromJson(json);
}
