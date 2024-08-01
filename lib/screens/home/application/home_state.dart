import 'package:for_the_table/model/restaurant/restaurantlist_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default([]) List<Restaurant>? restaurantList,
  }) = _HomeState;

  const HomeState._();
}
