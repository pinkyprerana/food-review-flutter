import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/screens/splash/application/splash_state.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier(this._dio, this._hiveDatabase) : super(const SplashState());

  final Dio _dio;
  final HiveDatabase _hiveDatabase;

}
