import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/screens/landing/application/landing_notifier.dart';
import 'package:for_the_table/screens/landing/application/landing_state.dart';

final landingNotifierProvider = StateNotifierProvider<LandingNotifier, LandingState>(
  (ref) => LandingNotifier(ref.watch(dioProvider), ref.watch(hiveProvider)),
);
