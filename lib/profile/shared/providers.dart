import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/profile/application/profile_notifier.dart';
import 'package:for_the_table/profile/application/profile_state.dart';

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) =>
        ProfileNotifier(ref.watch(dioProvider), ref.watch(hiveProvider)));
