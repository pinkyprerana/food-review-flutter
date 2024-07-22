import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/dio_exceptions.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/core/utils/validator.dart';
import 'package:for_the_table/model/user_profile/user_profile_model.dart';
import 'package:for_the_table/screens/profile/application/profile_state.dart';
import 'package:for_the_table/screens/profile/domain/user_activities.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../model/notification_model/notification_model.dart';
import '../../../model/saved_post_model/saved_post_model.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(
    this._dio,
    this._hiveDataBase,
      this._networkApiService
  ) : super(const ProfileState());

  final HiveDatabase _hiveDataBase;
  final Dio _dio;
  final NetworkApiService _networkApiService;

  final picker = ImagePicker();

  ProfileDetails? fetchedUser;

  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController contactNameController = TextEditingController();
  final TextEditingController contactEmailController = TextEditingController();
  final TextEditingController contactPhoneController = TextEditingController();
  final TextEditingController contactMessageController = TextEditingController();
  final RefreshController refreshController = RefreshController();

  void populateContactDetails() {
    contactNameController.text = state.fetchedUser?.fullName ?? '';
    contactEmailController.text = state.fetchedUser?.email ?? '';
    contactPhoneController.text = state.fetchedUser?.phone ?? '';
  }

  void loadMoreActivities() async {
    if (state.currentPage > state.totalPages) {
      showToastMessage('No new activities are available');
      refreshController.loadComplete();
      return;
    }

    await fetchUserActivities(perpage: 10, isLoadMore: true);
    refreshController.loadComplete();
  }

  Future<void> getUserDetails() async {
    try {
      state = state.copyWith(isLoading: true);

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };
      _dio.options.headers.addAll(headers);

      final response = await _dio.get('${AppUrls.BASE_URL}${AppUrls.profile}');

      if (response.statusCode == 200 && response.data != null) {
        fetchedUser = ProfileDetails.fromJson(response.data!['data']);
        final userProdileResponseModel = UserProfileModel.fromJson(response.data);

        state = state.copyWith(
          isLoading: false,
          fetchedUser: fetchedUser,
          userProfileResponseModel: userProdileResponseModel,
          profileImgPath: '${AppUrls.profilePicLocation}/${fetchedUser?.profileImage}',
        );
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');
        state = state.copyWith(isLoading: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Something went wrong, please try again');

      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> uploadProfileImage(BuildContext context) async {
    try {
      XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );

      state = state.copyWith(isLoading: true);

      final filePicked = File(pickedFile?.path ?? '');

      String fileName = filePicked.path.split('/').last;

      final FormData formData = FormData.fromMap({
        if (pickedFile != null)
          "profile_image": await MultipartFile.fromFile(
            filePicked.path,
          ),
        "email": state.fetchedUser?.email,
        "phone": state.fetchedUser?.phone,
        "first_name": state.fetchedUser?.firstName,
        "last_name": state.fetchedUser?.lastName,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.BASE_URL}${AppUrls.profileUpdate}',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        state = state.copyWith(
          isLoading: false,
          profileImgPath:
              '${AppUrls.profilePicLocation}/${response.data!['data']['profile_image']}',
          profileImage: fileName,
        );
        await getUserDetails();
      } else {
        showToastMessage('Please upload a media');

        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);

      showToastMessage('Something, went wrong, please try again');
    }
  }

  bool validateEmailField() {
    if (emailAddress.text.isEmpty) {
      showToastMessage('Please enter your email address');
      return false;
    } else if (emailAddress.text.isNotEmpty && !Validator.validateEmail(emailAddress.text)) {
      showToastMessage('Please enter a valid email');
      return false;
    } else {
      return true;
    }
  }

  bool validatePasswordFields() {
    if (oldPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      showToastMessage('No field can be blank');
      return false;
    } else if (oldPasswordController.text.length < 8 ||
        newPasswordController.text.length < 8 ||
        confirmPasswordController.text.length < 8) {
      showToastMessage('Password must contain at least 8 characters');
      return false;
    } else if (newPasswordController.text != confirmPasswordController.text) {
      showToastMessage('New password and confirm password does not match.');
      return false;
    } else {
      return true;
    }
  }

  Future<void> updatePassword(BuildContext context) async {
    if (validatePasswordFields()) {
      try {
        state = state.copyWith(isLoading: true);

        final FormData formData = FormData.fromMap({
          "old_password": oldPasswordController.text,
          "new_password": newPasswordController.text,
          "confirm_password": confirmPasswordController.text,
        });

        var headers = {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
        };

        _dio.options.headers.addAll(headers);

        final response = await _dio.post<Map<String, dynamic>>(
          '${AppUrls.BASE_URL}${AppUrls.updatePassword}',
          data: formData,
        );

        if (response.statusCode == 200 && response.data != null) {
          showToastMessage('Password updated successfully!');

          oldPasswordController.text = '';
          newPasswordController.text = '';
          confirmPasswordController.text = '';

          if (!context.mounted) return;
          Navigator.pop(context);

          state = state.copyWith(isLoading: false);
        } else {
          showToastMessage('Something went wrong, try again');

          oldPasswordController.text = '';
          newPasswordController.text = '';
          confirmPasswordController.text = '';

          state = state.copyWith(isLoading: false);
        }
      } catch (error) {
        state = state.copyWith(isLoading: false);

        oldPasswordController.text = '';
        newPasswordController.text = '';
        confirmPasswordController.text = '';

        showToastMessage('Something, went wrong, please try again');
      }
    }
  }

  Future<void> changeEmailAddress(BuildContext context) async {
    if (validateEmailField()) {
      try {
        state = state.copyWith(isBeingSubmitted: true);

        final FormData formData = FormData.fromMap({"email": emailAddress.text});

        var headers = {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
        };

        _dio.options.headers.addAll(headers);

        final response = await _dio.post<Map<String, dynamic>>(
          '${AppUrls.BASE_URL}${AppUrls.profileUpdate}',
          data: formData,
        );

        if (response.statusCode == 200 && response.data != null) {
          showToastMessage('Email Address Changed');

          emailAddress.text = '';

          await getUserDetails();

          if (!context.mounted) return;
          Navigator.pop(context);

          state = state.copyWith(isBeingSubmitted: false);
        } else {
          showToastMessage(response.statusMessage.toString());
          emailAddress.text = '';
          state = state.copyWith(isBeingSubmitted: false);
        }
      } catch (error) {
        state = state.copyWith(isBeingSubmitted: false);
        emailAddress.text = '';
        showToastMessage(error.toString());
      }
    }
  }

  bool validatePhoneNumber() {
    if (phoneNumber.text.isEmpty) {
      showToastMessage('Please enter your phone number');
      return false;
    } else if (phoneNumber.text.length < 10) {
      showToastMessage('Please enter a valid phone number');
      return false;
    } else if (!Validator.validatePhone(phoneNumber.text)) {
      showToastMessage('Please enter a valid phone number');
      return false;
    } else {
      return true;
    }
  }

  Future<void> changePhoneNumber(BuildContext context) async {
    if (validatePhoneNumber()) {
      try {
        state = state.copyWith(isBeingSubmitted: true);

        final FormData formData = FormData.fromMap({"phone": phoneNumber.text});

        var headers = {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
        };

        _dio.options.headers.addAll(headers);

        final response = await _dio.post<Map<String, dynamic>>(
          '${AppUrls.BASE_URL}${AppUrls.profileUpdate}',
          data: formData,
        );

        if (response.statusCode == 200 && response.data != null) {
          showToastMessage('Phone Number Changed');

          phoneNumber.text = '';

          await getUserDetails();

          if (!context.mounted) return;
          Navigator.pop(context);

          state = state.copyWith(isBeingSubmitted: false);
        } else {
          showToastMessage(response.statusMessage.toString());
          phoneNumber.text = '';
          state = state.copyWith(isBeingSubmitted: false);
        }
      } catch (error) {
        state = state.copyWith(isBeingSubmitted: false);
        phoneNumber.text = '';
        showToastMessage(error.toString());
      }
    }
  }

  Future<void> updateBio(BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);

      final FormData formData = FormData.fromMap({
        "bio": bioController.text,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.BASE_URL}${AppUrls.profileUpdate}',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        showToastMessage('Bio updated successfully!');

        await getUserDetails();

        if (!context.mounted) return;
        Navigator.pop(context);

        state = state.copyWith(isLoading: false);
      } else {
        showToastMessage(response.statusCode.toString());
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage(error.toString());
    }
  }

  bool validateContactFields() {
    if (contactNameController.text.isEmpty ||
        contactEmailController.text.isEmpty ||
        contactPhoneController.text.isEmpty ||
        contactMessageController.text.isEmpty) {
      showToastMessage('No field can be empty');
      return false;
    } else if (contactNameController.text.trim().length < 3) {
      showToastMessage('Name must have at least 3 letters.');
      return false;
    } else if (!Validator.validateEmail(contactEmailController.text)) {
      showToastMessage('Please enter a valid email id');
      return false;
    } else if (contactPhoneController.text.length < 10) {
      showToastMessage('Please enter a valid phone number');
      return false;
    }
    return true;
  }

  Future<void> requestHelp(BuildContext context) async {
    if (validateContactFields()) {
      try {
        state = state.copyWith(isLoading: true);

        final FormData formData = FormData.fromMap({
          "fullName": contactNameController.text,
          "email": contactEmailController.text,
          "subject": contactPhoneController.text,
          "message": contactMessageController.text,
        });

        var headers = {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
        };

        _dio.options.headers.addAll(headers);

        final response = await _dio.post<Map<String, dynamic>>(
          '${AppUrls.BASE_URL}${AppUrls.contact}',
          data: formData,
        );

        if (response.statusCode == 200 && response.data != null) {
          showToastMessage('Thank you for reaching out. Our team will get to you soon.');
          contactMessageController.text = '';

          if (!context.mounted) return;
          Navigator.pop(context);

          state = state.copyWith(isLoading: false);
        } else {
          showToastMessage(response.statusMessage.toString());
          contactMessageController.text = '';
          state = state.copyWith(isLoading: false);
        }
      } catch (error) {
        state = state.copyWith(isLoading: false);
        contactMessageController.text = '';
        showToastMessage(error.toString());
      }
    }
  }

  Future<void> fetchUserActivities({int? perpage, bool isLoadMore = false}) async {
    try {
      state = state.copyWith(isLoading: !isLoadMore);

      if (isLoadMore && (state.currentPage * 10 == state.userActivitiesList?.length)) {
        state = state.copyWith(currentPage: state.currentPage + 1);
      } else {
        state = state.copyWith(currentPage: 1);
      }

      final FormData formData = FormData.fromMap({
        "perpage": perpage ?? 3,
        "page": state.currentPage,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.BASE_URL}${AppUrls.userActivities}',
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        final userActivitiesModel = UserActivities.fromJson(response.data ?? {});
        final userActivities = userActivitiesModel.activitiesList;

        if (isLoadMore) {
          final activityIds = state.userActivitiesList?.map((activity) => activity.id).toSet();

          final uniqueActivities = userActivities
              ?.where((activity) => !(activityIds?.contains(activity.id) ?? false))
              .toList();

          if ((uniqueActivities?.isEmpty ?? false) && isLoadMore) {
            showToastMessage('No new activities are available.');
          }
          state = state.copyWith(
            isLoading: false,
            userActivitiesList: [
              ...state.userActivitiesList ?? [],
              ...uniqueActivities ?? [],
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          userActivitiesList: userActivities,
          totalPages: userActivitiesModel.pages ?? 0,
        );
      } else {
        showToastMessage(response.statusMessage.toString());
        contactMessageController.text = '';
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      contactMessageController.text = '';
      showToastMessage(error.toString());
    }
  }

  Future<void> logout({required BuildContext context}) async {
    try {
      state = state.copyWith(isLoading: true);

      AutoRouter.of(context).pushAndPopUntil(
        const LandingIntroRoute(),
        predicate: (_) => false,
      );
      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.get<Map<String, dynamic>>(
        '${AppUrls.BASE_URL}${AppUrls.logout}',
      );

      if (response.statusCode == 200 && response.data != null) {
        await _hiveDataBase.box.delete(AppPreferenceKeys.token);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userEmail);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userId);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userFirstName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userLastName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.fullName);
        await _hiveDataBase.box.delete(AppPreferenceKeys.userPhone);
        await _hiveDataBase.box.delete(AppPreferenceKeys.profileImage);
        await _hiveDataBase.box.delete(AppPreferenceKeys.latitude);
        await _hiveDataBase.box.delete(AppPreferenceKeys.longitude);

        await _hiveDataBase.box.clear();

        state = state.copyWith(isLoading: false);
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoading: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to logout');

      state = state.copyWith(isLoading: false);
    }
  }


  String? get getLatitude=> _hiveDataBase.box.get(AppPreferenceKeys.latitude);
  String? get getLongitude=> _hiveDataBase.box.get(AppPreferenceKeys.longitude);

  Future<void> getSavedList() async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${'/post-save/list'}',
          body:
          {
            "lat": getLatitude,
            "lng": getLongitude,
          }
      );
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        SavedPostModel savedModel = SavedPostModel.fromJson(response.data);
        if (savedModel.status == 200) {
          state = state.copyWith(
              isLoading: false,
              savedList:
              savedModel.savedList
          );

        } else {
          showToastMessage(savedModel.message.toString());
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

}
