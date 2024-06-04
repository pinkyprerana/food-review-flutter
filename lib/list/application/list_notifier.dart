import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/list/application/list_state.dart';

class ListNotifier extends StateNotifier<ListState> {
  ListNotifier(this._dio, this._hiveDatabase) : super(const ListState());

  final Dio _dio;
  final HiveDatabase _hiveDatabase;

  void setListIndex(int index) {
    state = state.copyWith(listIndex: index);
    print(state.listIndex);
  }
}
