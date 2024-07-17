import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/profile_notifier.dart';
import '../application/profile_state.dart';

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) =>
        ProfileNotifier(ref.watch(dioProvider), ref.watch(hiveProvider)));
