import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/restaurant_notifier.dart';
import '../application/restaurant_state.dart';

final restaurantNotifierProvider = StateNotifierProvider<RestaurantNotifier, RestaurantState>(
    (ref) => RestaurantNotifier(
        ref.watch(dioProvider), ref.watch(hiveProvider), ref.watch(networkService)));
