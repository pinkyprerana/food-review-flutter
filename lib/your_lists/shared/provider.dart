import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/yourPeople_notifier.dart';
import '../application/yourPeople_state.dart';


final YourPeopleNotifierProvider = StateNotifierProvider<YourPeopleNotifier, YourPeopleState>(
      (ref) =>YourPeopleNotifier(
    ref.watch(networkService),
    ref.watch(hiveProvider),
  ),
);
