import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/your_people_notifier.dart';
import '../application/your_people_state.dart';

final yourPeopleNotifierProvider = StateNotifierProvider<YourPeopleNotifier, YourPeopleState>(
  (ref) => YourPeopleNotifier(
    ref.watch(dioProvider),
    ref.watch(hiveProvider),
  ),
);
