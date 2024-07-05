import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/your_lists/application/yourPeople_state.dart';
import '../../core/constants/app_urls.dart';
import '../../core/infrastructure/hive_database.dart';
import '../../core/infrastructure/network_api_services.dart';
import '../../core/utils/toast.dart';


class YourPeopleNotifier extends StateNotifier<YourPeopleState> {
  YourPeopleNotifier(this._networkApiService, this._hiveDatabase) : super(const YourPeopleState());

  final NetworkApiService _networkApiService;
  final HiveDatabase _hiveDatabase;



  updateSelectedIndex(int index){
    state = state.copyWith(selectedIndex: index);
  }

}
