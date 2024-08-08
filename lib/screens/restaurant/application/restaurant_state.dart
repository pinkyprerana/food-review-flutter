// ignore: depend_on_referenced_packages

import 'package:for_the_table/model/restaurant/postlist_per_restaurant_response_model.dart';
import 'package:for_the_table/model/restaurant/restaurantlist_response_model.dart';
import 'package:for_the_table/model/restaurant/saved_restaurants_response_model.dart';
import 'package:for_the_table/screens/post_feed/domain/post_feed_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'restaurant_state.freezed.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState({
    @Default(false) bool isLoading,
    @Default([]) List<Restaurant>? restaurantList,
    @Default([]) List<Restaurant>? homeRestaurantList,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,
    @Default(1) int totalPages,
    @Default(true) isMoreDataFetchable,
    @Default([]) List<DataOfPostModel>? postList,
    @Default([]) List<Post>? postPerRestaurantList,
    @Default(1) int currentPageForPosts,
    @Default(false) bool isLoadingForPosts,
    @Default(1) int totalPagesPosts,
    @Default(false) bool isLoadingForRestaurantDetails,
    @Default(0) int totalNumberOfRestaurants,
    @Default(false) bool isLoadingSaveRestaurant,
    @Default(false) bool isLoadingSaveRestaurantList,
    @Default(1) int currentPageForSavedRestaurantList,
    @Default(1) int totalPagesForSavedRestaurantList,
    @Default([]) List<SavedRestaurant>? savedRestaurantList,
    @Default(0) double sliderValue,
    XFile? imageOrVideo,
    @Default(false) bool isLoadingForImageUpload,
    @Default(false) bool isVideo,
    @Default(false) bool isLoadingForReviewSubmit,
  }) = _RestaurantState;
  const RestaurantState._();
}
