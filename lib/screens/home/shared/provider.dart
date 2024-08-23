import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/screens/home/application/home_notifier.dart';
import 'package:for_the_table/screens/home/application/home_state.dart';
import 'package:for_the_table/screens/people_profile/shared/providers.dart';

final homeNotifierProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(
    ref.watch(dioProvider),
    ref.watch(hiveProvider),
    ref.watch(networkService),
    ref.watch(followNotifierProvider.notifier),
  );
});
