import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/your_lists/application/yourPeople_state.dart';
import '../../core/constants/app_urls.dart';
import '../../core/infrastructure/hive_database.dart';
import '../../core/infrastructure/network_api_services.dart';
import '../../core/utils/app_log.dart';
import '../../core/utils/toast.dart';
import '../domain/following_model.dart';
import '../domain/follower_model.dart';



class YourPeopleNotifier extends StateNotifier<YourPeopleState> {
  YourPeopleNotifier(this._networkApiService, this._hiveDatabase) : super(const YourPeopleState());

  final NetworkApiService _networkApiService;
  final HiveDatabase _hiveDatabase;



  updateSelectedIndex(int index){
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> getAllFollowingList() async {
    state = state.copyWith(isLoading: true);

    try {
      var (response, dioException) =
      await _networkApiService.postApiRequestWithToken(
          url: "${AppUrls.BASE_URL}${AppUrls.getAllFollowing}");

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        FollowingModel followingModel =
        FollowingModel.fromJson(response.data);
        DataOfFollowingModel dataOfFollowingModel =
        DataOfFollowingModel.fromJson(response.data);
        if (followingModel.status == 200) {
          state = state.copyWith(
            isLoading: false,
            followingList: followingModel.followingList,
            userId: dataOfFollowingModel.id
          );
          AppLog.log("Updated Follow List: ${followingModel.followingList}");
        } else {
          showToastMessage(followingModel.message.toString());
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> getAllFollowerList() async {
    state = state.copyWith(isLoading: true);

    try {
      var (response, dioException) =
      await _networkApiService.postApiRequestWithToken(
          url: "${AppUrls.BASE_URL}${AppUrls.getAllFollowers}");

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        FollowerModel followerModel =
        FollowerModel.fromJson(response.data);
        if (followerModel.status == 200) {
          state = state.copyWith(isLoading: false,
              followerList: followerModel.followerList);
        } else {
          showToastMessage(followerModel.message.toString());
        }
      }
    } catch (error) {
      AppLog.log(error.toString());
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

}
