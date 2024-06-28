import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/your_lists/application/yourPeople_state.dart';
import '../../core/infrastructure/hive_database.dart';


class YourPeopleNotifier extends StateNotifier<YourPeopleState> {
  YourPeopleNotifier(this._dio, this._hiveDatabase) : super(const YourPeopleState());

  final Dio _dio;
  final HiveDatabase _hiveDatabase;

  updateSelectedIndex(int index){
    state = state.copyWith(selectedIndex: index);
  }
}
