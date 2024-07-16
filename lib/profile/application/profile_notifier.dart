import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/dio_exceptions.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/core/utils/validator.dart';
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

  void populateContactDetails() {
    contactNameController.text = state.fetchedUser?.fullName ?? '';
    contactEmailController.text = state.fetchedUser?.email ?? '';
    contactPhoneController.text = state.fetchedUser?.phone ?? '';
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
        AppLog.log('response ===== $response');

        fetchedUser = ProfileDetails.fromJson(response.data!['data']);
        final userProdileResponseModel = UserProfileModel.fromJson(response.data);

        state = state.copyWith(
          isLoading: false,
          fetchedUser: fetchedUser,
          userProfileResponseModel: userProdileResponseModel,
          profileImgPath: '${AppUrls.profilePicLocation}/${fetchedUser?.profileImage}',
        );
        AppLog.log('state.fetchedUser =============== ${state.fetchedUser}');
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

      AppLog.log('TOKEN ---- ${_hiveDataBase.box.get(AppPreferenceKeys.token)}');

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
        AppLog.log('------SUCCESS----------');
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
      showToastMessage('Please enter your Email Address');
      return false;
    } else if (emailAddress.text.isNotEmpty && !Validator.validateEmail(emailAddress.text)) {
      showToastMessage('Please enter Valid Email');
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

        AppLog.log(response.toString());

        if (response.statusCode == 200 && response.data != null) {
          showToastMessage('Password updated successfully!');

          oldPasswordController.text = '';
          newPasswordController.text = '';
          confirmPasswordController.text = '';

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
        state = state.copyWith(isLoading: true);

        final FormData formData = FormData.fromMap({
          // if (pickedFile != null)
          //   "profile_image": await MultipartFile.fromFile(
          //     filePicked.path,
          //   ),
          "email": emailAddress.text,
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
          showToastMessage('Email Address Changed');

          emailAddress.text = '';

          await getUserDetails();

          Navigator.pop(context);

          state = state.copyWith(isLoading: false);
        } else {
          showToastMessage('Something went wrong, try again');

          emailAddress.text = '';

          state = state.copyWith(isLoading: false);
        }
      } catch (error) {
        state = state.copyWith(isLoading: false);

        emailAddress.text = '';

        showToastMessage('Something, went wrong, please try again');
      }
    }
  }

  bool validatePhoneNumber() {
    if (phoneNumber.text.isEmpty) {
      showToastMessage('Please Enter Your Phone Number');
      return false;
    } else if (phoneNumber.text.isNotEmpty && phoneNumber.text.length < 10) {
      showToastMessage('Please Enter A Valid Phone Number');
      return false;
    } else if (phoneNumber.text.isNotEmpty && !Validator.validatePhone(phoneNumber.text)) {
      showToastMessage('Please enter a valid phone number');
      return false;
    } else {
      return true;
    }
  }

  Future<void> changePhoneNumber(BuildContext context) async {
    if (validatePhoneNumber()) {
      try {
        state = state.copyWith(isLoading: true);

        final FormData formData = FormData.fromMap({
          "email": state.fetchedUser?.email,
          "phone": phoneNumber.text,
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
          showToastMessage('Phone Number Changed');

          phoneNumber.text = '';

          await getUserDetails();

          Navigator.pop(context);

          state = state.copyWith(isLoading: false);
        } else {
          showToastMessage('Something went wrong, try again');

          phoneNumber.text = '';

          state = state.copyWith(isLoading: false);
        }
      } catch (error) {
        state = state.copyWith(isLoading: false);

        phoneNumber.text = '';

        showToastMessage('Something, went wrong, please try again');
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

        Navigator.pop(context);

        state = state.copyWith(isLoading: false);
      } else {
        showToastMessage('Something went wrong, try again');
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage('Something, went wrong, please try again');
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
          Navigator.pop(context);

          state = state.copyWith(isLoading: false);
        } else {
          showToastMessage('Something went wrong, try again');
          contactMessageController.text = '';
          state = state.copyWith(isLoading: false);
        }
      } catch (error) {
        state = state.copyWith(isLoading: false);
        contactMessageController.text = '';
        showToastMessage('Something, went wrong, please try again');
      }
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
}
