import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'list_state.dart';

class ListNotifier extends StateNotifier<ListState> {
  ListNotifier(this._dio, this._hiveDatabase) : super(const ListState());

  // ignore: unused_field
  final Dio _dio;
  // ignore: unused_field
  final HiveDatabase _hiveDatabase;

  void setListIndex(int index) {
    state = state.copyWith(listIndex: index);
  }
}
