// ignore: depend_on_referenced_packages

import 'package:for_the_table/model/restaurant/restaurantlist_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../post_feed/domain/postFeed_model.dart';

part 'restaurant_state.freezed.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState({
    @Default(false) bool isLoading,
    @Default([]) List<Restaurant>? restaurantList,
    @Default([]) List<Restaurant>? homeRestaurantList,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,
    @Default(0) int totalPages,
    @Default(true) isMoreDataFetchable,
    @Default([]) List<DataOfPostModel> postList
  }) = _RestaurantState;
  const RestaurantState._();
}
