import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/list/application/list_notifier.dart';
import 'package:for_the_table/list/application/list_state.dart';

final listProvider = StateNotifierProvider.autoDispose<ListNotifier, ListState>(
  (ref) => ListNotifier(ref.watch(dioProvider), ref.watch(hiveProvider)),
);
