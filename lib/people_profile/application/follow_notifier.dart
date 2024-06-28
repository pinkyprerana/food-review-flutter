import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'follow_state.dart';

class FollowNotifier extends StateNotifier<FollowState> {
  FollowNotifier(this._dio, this._hiveDatabase) : super(const FollowState());

  final Dio _dio;
  final HiveDatabase _hiveDatabase;

   setFollowingState(bool following) {
     state = state.copyWith(isFollowing: !state.isFollowing);
  }
}
