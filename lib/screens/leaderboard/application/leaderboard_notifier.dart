import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/screens/leaderboard/application/leaderboard_state.dart';
import 'package:for_the_table/screens/leaderboard/domain/leaderboard_details_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LeaderboardNotifier extends StateNotifier<LeaderboardState> {
  LeaderboardNotifier(this._dio, this._hiveDatabase) : super(const LeaderboardState());

  // ignore: unused_field
  final Dio _dio;
  // ignore: unused_field
  final HiveDatabase _hiveDatabase;

  final RefreshController refreshController = RefreshController();
  final TextEditingController searchController = TextEditingController();

  @override
  dispose() {
    searchController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  void loadMoreLeaders() async {
    if (state.currentPage > state.totalPages) {
      showToastMessage('No new profiles to display');
      refreshController.loadComplete();
      return;
    }

    await fetchLeaderboardList(isLoadMore: true);
    refreshController.loadComplete();
  }

  void searchStandings() async {
    await fetchLeaderboardList(isSearch: true);
  }

  void clearSearch() {
    searchController.clear();
  }

  Future<void> fetchLeaderboardList({bool isLoadMore = false, bool isSearch = false}) async {
    try {
      state = state.copyWith(isLoading: !isLoadMore && !isSearch);

      if (isLoadMore && (state.currentPage * 10 == state.leaderboardList.length)) {
        state = state.copyWith(currentPage: state.currentPage + 1);
      } else {
        state = state.copyWith(currentPage: 1);
      }

      final FormData formData = FormData.fromMap({
        "perpage": 10,
        "page": state.currentPage,
        if (searchController.text.isNotEmpty) "search": searchController.text,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      var response = await _dio.post(
        "${AppUrls.baseUrl}${AppUrls.getLeaderboardList}",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        LeaderboardDetailsModel leaderboardDetailsModel =
            LeaderboardDetailsModel.fromJson(response.data);

        if (isLoadMore) {
          final currentLeaders = state.leaderboardList.map((user) => user.id).toSet();

          final uniqueLeaders = leaderboardDetailsModel.data
              ?.where((friend) => !currentLeaders.contains(friend.id))
              .toList();

          if ((uniqueLeaders?.isEmpty ?? false) && isLoadMore) {
            showToastMessage('No new profiles to display.');
          }

          state = state.copyWith(
            isLoading: false,
            leaderboardList: [
              ...state.leaderboardList,
              ...uniqueLeaders ?? [],
            ],
          );

          return;
        }

        state = state.copyWith(
          totalStandings: leaderboardDetailsModel.total ?? 0,
          leaderboardList: leaderboardDetailsModel.data ?? [],
          totalPages: leaderboardDetailsModel.pages ?? 0,
          isLoading: false,
        );
      }
    } catch (e) {
      AppLog.log(e.toString());
    }
  }
}
