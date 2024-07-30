import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'restaurant_details_model.freezed.dart';
part 'restaurant_details_model.g.dart';

@freezed
class RestaurantDetailsModel with _$RestaurantDetailsModel {
  const factory RestaurantDetailsModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") RestaurantDataModel? restaurantDataModel,
  }) = _RestaurantDetailsModel;

  factory RestaurantDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailsModelFromJson(json);
}

@freezed
class RestaurantDataModel with _$RestaurantDataModel {
  const factory RestaurantDataModel({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "image") List<String>? image,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "street") String? street,
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
    @JsonKey(name: "place_id") String? placeId,
    @JsonKey(name: "rating") String? rating,
    @JsonKey(name: "user_ratings_total") String? userRatingsTotal,
    @JsonKey(name: "types") List<dynamic>? types,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "isSave") bool? isSave,
  }) = _RestaurantDataModel;

  factory RestaurantDataModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDataModelFromJson(json);
}

@freezed
class GeoLoc with _$GeoLoc {
  const factory GeoLoc({
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "coordinates") List<double>? coordinates,
  }) = _GeoLoc;

  factory GeoLoc.fromJson(Map<String, dynamic> json) => _$GeoLocFromJson(json);
}
