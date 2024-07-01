import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/dio_exceptions.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/model/user_profile/user_profile_model.dart';
import 'package:for_the_table/profile/application/profile_state.dart';
import 'package:image_picker/image_picker.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(
    this._dio,
    this._hiveDataBase,
  ) : super(const ProfileState());

  final HiveDatabase _hiveDataBase;
  final Dio _dio;

  final picker = ImagePicker();

  Future<void> getUserDetails({required BuildContext context}) async {
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
        AppLog.log('response ===== $response');

        final fetchedUser = ProfileDetails.fromJson(response.data!['data']);
        final userProdileResponseModel =
            UserProfileModel.fromJson(response.data);

        state = state.copyWith(
          isLoading: false,
          fetchedUser: fetchedUser,
          userProfileResponseModel: userProdileResponseModel,
          profileImgPath:
              '${AppUrls.profilePicLocation}/${fetchedUser.profileImage}',
        );
        AppLog.log('state.fetchedUser =============== ${state.fetchedUser}');
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');
        state = state.copyWith(isLoading: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error,
          errorMessage: 'Something went wrong, please try again');

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

      AppLog.log('fileName --------->> $fileName');

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
        );
      } else {
        showToastMessage('Please upload a media');

        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);

      showToastMessage('Something, went wrong, please try again');
    }
  }
}
