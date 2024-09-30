import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/shared/providers.dart';
import '../application/base_notifier.dart';
import '../application/base_state.dart';

final baseNotifierProvider =
    StateNotifierProvider.autoDispose<BaseNotifier, BaseState>(
        (ref) => BaseNotifier(ref.watch(dioProvider), ref.watch(hiveProvider)));
