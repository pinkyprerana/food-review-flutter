import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/location/application/location_state.dart';
import 'package:for_the_table/onboarding/application/preference_state.dart';
import '../../core/constants/app_urls.dart';
import '../../core/infrastructure/network_api_services.dart';
import '../../core/utils/app_log.dart';
import '../../core/utils/toast.dart';

class LocationNotifier extends StateNotifier<LocationState> {
  LocationNotifier(
    this._dio,
    this._hiveDataBase,
  ) : super(const LocationState());

  final Dio _dio;
  final HiveDatabase _hiveDataBase;
}
