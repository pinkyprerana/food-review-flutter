import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/post_feed/application/post_feed_state.dart';

class PostFeedNotifier extends StateNotifier<PostFeedState> {
  PostFeedNotifier(this._dio, this._hiveDatabase)
      : super(const PostFeedState());

  final Dio _dio;
  final HiveDatabase _hiveDatabase;

  // void setListIndex(int index) {
  //   state = state.copyWith(listIndex: index);
  //   print(state.listIndex);
  // }

  void setIsExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
    AppLog.log('state.isExpanded===== ${state.isExpanded}');
  }
}
