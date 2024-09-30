// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_restaurants_response_model.freezed.dart';
part 'saved_restaurants_response_model.g.dart';

@freezed
class SavedRestaurantsResponseModel with _$SavedRestaurantsResponseModel {
  const factory SavedRestaurantsResponseModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<SavedRestaurant>? savedRestaurantList,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "pages") int? pages,
    @JsonKey(name: "limit") int? limit,
  }) = _SavedRestaurantsResponseModel;

  factory SavedRestaurantsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SavedRestaurantsResponseModelFromJson(json);
}

@freezed
class SavedRestaurant with _$SavedRestaurant {
  const factory SavedRestaurant({
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
    @Default(true) bool? isSaveLocally,
  }) = _SavedRestaurant;

  factory SavedRestaurant.fromJson(Map<String, dynamic> json) =>
      _$SavedRestaurantFromJson(json);
}

@freezed
class GeoLoc with _$GeoLoc {
  const factory GeoLoc({
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "coordinates") List<double>? coordinates,
  }) = _GeoLoc;

  factory GeoLoc.fromJson(Map<String, dynamic> json) => _$GeoLocFromJson(json);
}
