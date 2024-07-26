import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/screens/onboarding/application/preference_state.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/infrastructure/network_api_services.dart';
import '../../../core/utils/app_log.dart';
import '../../../core/utils/toast.dart';
import '../domain/preference_model.dart';

class PreferenceNotifier extends StateNotifier<PreferenceState> {
  PreferenceNotifier(this._networkApiService)
      : super(const PreferenceState());

  final NetworkApiService _networkApiService;

  void addTag(String tag) {
    state = state.copyWith(tags: [...state.tags, tag]);
  }

  void removeTag(String tag) {
    state = state.copyWith(tags: state.tags.where((t) => t != tag).toList());
  }

  void toggleTag(String tag) {
    if (state.tags.contains(tag)) {
      removeTag(tag);
    } else {
      addTag(tag);
    }
  }

  // Future<void> selectPreference(VoidCallback voidCallback) async {
  //     state = state.copyWith(isLoading: true);
  //
  //     try {
  //       var (
  //       response,
  //       dioException
  //       ) = await _networkApiService.postApiRequest(
  //           url:
  //           '${AppUrls.BASE_URL}${'user/add-preferences'}',
  //           body: {
  //             // "preferences": preferences,
  //           });
  //       state = state.copyWith(isLoading: false);
  //
  //       if (response == null && dioException == null) {
  //         showConnectionWasInterruptedToastMessage();
  //       } else if (dioException != null) {
  //         showDioError(dioException);
  //       } else {
  //         Map<String, dynamic> jsonData = response.data;
  //
  //         if (response.statusCode == 200) {
  //           showToastMessage(jsonData['message']);
  //           voidCallback.call();
  //         } else {
  //           showToastMessage(jsonData['message']);
  //         }
  //       }
  //     } catch (error) {
  //       state = state.copyWith(isLoading: false);
  //       showConnectionWasInterruptedToastMessage();
  //     }
  //   }

  Future<void> getAllPreference() async {
    state = state.copyWith(isLoading: true);

    try {
      var (response, dioException) =
      await _networkApiService.getApiRequest(
          url: "${AppUrls.BASE_URL}${AppUrls.getAllPreference}");

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        PreferenceModel preferenceModel =
        PreferenceModel.fromJson(response.data);
        if (preferenceModel.status == 200) {
          state = state.copyWith(isLoading: false,
              data: preferenceModel.data);
        } else {
          showToastMessage(preferenceModel.message.toString());
        }
      }
    } catch (error) {
      AppLog.log(error.toString());
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }
}



