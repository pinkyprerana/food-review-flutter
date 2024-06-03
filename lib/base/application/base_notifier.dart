// ignore_for_file: parameter_assignments, empty_catches
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/infrastructure/hive_database.dart';
import 'base_state.dart';

class BaseNotifier extends StateNotifier<BaseState> {
  BaseNotifier(this._dio, this._hiveDatabase) : super(const BaseState());

  final Dio _dio;
  final HiveDatabase _hiveDatabase;

  void tapBottomNavIndex(int value) {
    state = state.copyWith(lastBottomNavIndex: state.bottomNavIndex);

    state = state.copyWith(bottomNavIndex: value);
  }

  void resetBottomNavigation() {
    state = state.copyWith(bottomNavIndex: 2);
  }

  void backToPreviousScreen() {
    state = state.copyWith(bottomNavIndex: state.lastBottomNavIndex);
  }

  void resetBottomNavIndex() {
    state = state.copyWith(bottomNavIndex: 0);
    state = state.copyWith(lastBottomNavIndex: 0);
  }
}