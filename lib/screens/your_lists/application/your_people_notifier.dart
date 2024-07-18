import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/screens/your_lists/application/your_people_state.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/infrastructure/hive_database.dart';
import '../../../core/utils/app_log.dart';
import '../../../core/utils/toast.dart';
import '../domain/following_model.dart';
import '../domain/follower_model.dart';

class YourPeopleNotifier extends StateNotifier<YourPeopleState> {
  YourPeopleNotifier(this._dio, this._hiveDatabase) : super(const YourPeopleState());

  final HiveDatabase _hiveDatabase;
  final Dio _dio;

  updateSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> getAllFollowingList() async {
    state = state.copyWith(isLoading: true);

    try {
      var response = await _dio.post("${AppUrls.BASE_URL}${AppUrls.getAllFollowing}");

      if (response.statusCode == 200 && response.data != null) {
        FollowingModel followingModel = FollowingModel.fromJson(response.data);
        DataOfFollowingModel dataOfFollowingModel = DataOfFollowingModel.fromJson(response.data);
        if (followingModel.status == 200) {
          state = state.copyWith(
              isLoading: false,
              followingList: followingModel.followingList,
              userId: dataOfFollowingModel.id);
          AppLog.log("Updated Follow List: ${followingModel.followingList}");
        } else {
          showToastMessage(followingModel.message.toString());
        }
      } else {
        showToastMessage(response.statusMessage.toString());
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage(error.toString());
    }
  }

  Future<void> getAllFollowerList() async {
    state = state.copyWith(isLoading: true);

    try {
      final FormData formData = FormData.fromMap({
        "perpage": 10,
        "page": state.currentPage,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);
      var response =
          await _dio.post("${AppUrls.BASE_URL}${AppUrls.getAllFollowers}", data: formData);

      if (response.statusCode == 200 && response.data != null) {
        FollowerModel followerModel = FollowerModel.fromJson(response.data);
        if (followerModel.status == 200) {
          state = state.copyWith(isLoading: false, followerList: followerModel.followerList);
        } else {
          showToastMessage(followerModel.message.toString());
        }
      } else {
        showToastMessage(response.statusMessage.toString());
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage(error.toString());
    }
  }
}
