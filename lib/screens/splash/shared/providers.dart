import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/splash_notifier.dart';
import '../application/splash_state.dart';

final splashNotifierProvider =
    StateNotifierProvider.autoDispose<SplashNotifier, SplashState>((ref) =>
        SplashNotifier(ref.watch(dioProvider), ref.watch(hiveProvider)));
