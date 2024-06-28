import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/auth/application/auth_notifier.dart';
import 'package:for_the_table/auth/application/auth_state.dart';
import 'package:for_the_table/core/shared/providers.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(hiveProvider),
    ref.watch(networkService)
  ),
);
