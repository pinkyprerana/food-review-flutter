import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/preference_notifier.dart';
import '../application/preference_state.dart';


final preferenceNotifierProvider = StateNotifierProvider<PreferenceNotifier, PreferenceState>(
      (ref) =>PreferenceNotifier(
    ref.watch(dioProvider),
    ref.watch(networkService),
  ),
);
