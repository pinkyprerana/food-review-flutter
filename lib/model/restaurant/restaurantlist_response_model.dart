// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurantlist_response_model.freezed.dart';
part 'restaurantlist_response_model.g.dart';

@freezed
class RestaurantlistResponseModel with _$RestaurantlistResponseModel {
  const factory RestaurantlistResponseModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<Restaurant>? restaurantList,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "pages") int? pages,
    @JsonKey(name: "limit") int? limit,
  }) = _RestaurantlistResponseModel;

  factory RestaurantlistResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantlistResponseModelFromJson(json);
}

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "image") List<String>? image,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "zipcode") String? zipcode,
    @JsonKey(name: "geo_loc") GeoLoc? geoLoc,
    @JsonKey(name: "lng") String? lng,
    @JsonKey(name: "lat") String? lat,
    @JsonKey(name: "landmark") String? landmark,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "user_ratings_total") String? userRatingsTotal,
    @JsonKey(name: "rating") String? rating,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "street") String? street,
    @JsonKey(name: "place_id") String? placeId,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
}

@freezed
class GeoLoc with _$GeoLoc {
  const factory GeoLoc({
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "coordinates") List<double>? coordinates,
  }) = _GeoLoc;

  factory GeoLoc.fromJson(Map<String, dynamic> json) => _$GeoLocFromJson(json);
}
