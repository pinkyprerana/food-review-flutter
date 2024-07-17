import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/location_notifier.dart';
import '../application/location_state.dart';

final locationNotifierProvider =
    StateNotifierProvider.autoDispose<LocationNotifier, LocationState>((ref) =>
        LocationNotifier(ref.watch(dioProvider), ref.watch(hiveProvider)));
