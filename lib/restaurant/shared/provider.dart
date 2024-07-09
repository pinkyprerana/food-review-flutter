import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/restaurant/application/restaurant_notifier.dart';
import 'package:for_the_table/restaurant/application/restaurant_state.dart';

final restaurantNotifierProvider = StateNotifierProvider
    .autoDispose<RestaurantNotifier, RestaurantState>((ref) =>
        RestaurantNotifier(ref.watch(dioProvider), ref.watch(hiveProvider), ref.watch(networkService)));
