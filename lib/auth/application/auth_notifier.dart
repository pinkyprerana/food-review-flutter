import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/auth/application/auth_state.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/core/utils/validator.dart';
import '../../core/constants/app_urls.dart';
import '../../core/infrastructure/network_api_services.dart';
import '../../core/utils/app_log.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier( this._hiveDatabase, this._networkApiService) : super(const AuthState());

  final NetworkApiService _networkApiService;
  final HiveDatabase _hiveDatabase;

  //login
  final TextEditingController loginEmailTextController =
      TextEditingController();
  final TextEditingController loginPasswordTextController =
      TextEditingController();

  //signup
  final TextEditingController signupEmailTextController =
      TextEditingController();
  final TextEditingController signupFirstNameTextController =
      TextEditingController();
  final TextEditingController signupLastNameTextController =
      TextEditingController();
  final TextEditingController signupContactNumberTextController =
      TextEditingController();
  final TextEditingController signupPasswordTextController =
      TextEditingController();
  final TextEditingController signupConfirmPasswordTextController =
      TextEditingController();

  //forgot-password
  final TextEditingController fpEmailTextController =
      TextEditingController();
  final TextEditingController fpOtpTextController =
      TextEditingController();
  final TextEditingController fpPasswordTextController =
      TextEditingController();
  final TextEditingController fpConfirmPasswordTextController =
      TextEditingController();

  void clearLoginFields() {
    loginEmailTextController.clear();
    loginPasswordTextController.clear();
  }

  void clearRegistrationFields() {
    signupFirstNameTextController.clear();
    signupLastNameTextController.clear();
    signupEmailTextController.clear();
    signupContactNumberTextController.clear();
    signupPasswordTextController.clear();
    signupConfirmPasswordTextController.clear();
  }

  bool validateLoginFields({VoidCallback? onSuccess}) {
    if (loginEmailTextController.text.isEmpty) {
      showToastMessage('Please enter email');
      return false;
    } else if (!Validator.validateEmail(loginEmailTextController.text)) {
      showToastMessage('Please enter valid email');
      return false;
    } else if (loginPasswordTextController.text.isEmpty) {
      showToastMessage('Please enter password');
      return false;
    } else if (loginPasswordTextController.text.length < 6) {
      showToastMessage('Password should be at least 6 characters');
      return false;
    } else {
      return true;
    }
  }

  bool validateSignupFields() {
    if (signupFirstNameTextController.text.isEmpty) {
      showToastMessage('Please enter first name');
      return false;
    } else if (signupLastNameTextController.text.isEmpty) {
      showToastMessage('Please enter last name');
      return false;
    } else if (signupEmailTextController.text.isEmpty) {
      showToastMessage('Please enter email');
      return false;
    } else if (!Validator.validateEmail(signupEmailTextController.text)) {
      showToastMessage('Please enter valid email');
      return false;
    } if (signupContactNumberTextController.text.isEmpty) {
      showToastMessage('Please Enter Your Phone Number');
      return false;
    } else if (signupContactNumberTextController.text.isNotEmpty
        && signupContactNumberTextController.text.length < 10)
    {
      showToastMessage('Please Enter A Valid Phone Number');
      return false;
    } else if (signupContactNumberTextController.text.isNotEmpty &&
        !Validator.validatePhone(signupContactNumberTextController.text)) {
      showToastMessage('Please enter a valid phone number');
      return false;
    } else if (signupPasswordTextController.text.isEmpty) {
      showToastMessage('Please enter password');
      return false;
    } else if (signupConfirmPasswordTextController.text.isEmpty) {
      showToastMessage('Please enter your confirm password');
      return false;
    } else if (signupPasswordTextController.text.length < 6) {
      showToastMessage('Please enter at lease 6 digit password');
      return false;
    } else if (signupPasswordTextController.text !=
        signupConfirmPasswordTextController.text) {
      showToastMessage('Password and confirm password can\'t be different');
      return false;
    }
    else {
      return true;
    }
  }

  Future<void> signIn(VoidCallback voidCallback) async {
    state = state.copyWith(isLoading: true);

    final isInputValid = validateLoginFields();

    if (!isInputValid) {
      state = state.copyWith(isLoading: false);
      return;
    }

    try {
      var (response, dioException) = await _networkApiService
          .postApiRequest(url: '${AppUrls.BASE_URL}${AppUrls.signin}', body: {
        "email": loginEmailTextController.text.toLowerCase(),
        "password": loginPasswordTextController.text,
      });
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;
        if (response.statusCode == 200) {
          AppLog.log(jsonEncode(jsonData));
          print(jsonData);

          _hiveDatabase.box
              .put(AppPreferenceKeys.token, jsonData['token'] ?? '');
          _hiveDatabase.box
              .put(AppPreferenceKeys.userId, jsonData['data']['_id'] ?? '');
          _hiveDatabase.box.put(AppPreferenceKeys.userFirstName,
              jsonData['data']['first_name'] ?? '');
          _hiveDatabase.box.put(
              AppPreferenceKeys.userLastName, jsonData['data']['last_name'] ?? '');
          _hiveDatabase.box.put(
              AppPreferenceKeys.fullName, jsonData['data']['fullName'] ?? '');
          _hiveDatabase.box
              .put(AppPreferenceKeys.userPhone, jsonData['data']['phone'] ?? '');
          _hiveDatabase.box
              .put(AppPreferenceKeys.userEmail, jsonData['data']['email'] ?? '');
          _hiveDatabase.box.put(AppPreferenceKeys.profileImage,
              jsonData['data']['profile_image'] ?? '');
          _hiveDatabase.box
              .put(AppPreferenceKeys.userCity, jsonData['data']['city'] ?? '');
          showToastMessage(jsonData["message"]);
          loginEmailTextController.clear();
          loginPasswordTextController.clear();
          voidCallback.call();
        } else if (jsonData['message'] ==
            "Sorry user is deleted by admin. Please contact with admin.") {
          showToastMessage('Account has been deleted by Admin');
        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> signUp(VoidCallback? voidCallback) async {
    state = state.copyWith(isLoading: true);

    final firstName = signupFirstNameTextController.text;
    final lastName = signupLastNameTextController.text;
    final email = signupEmailTextController.text;
    final phone = signupContactNumberTextController.text;
    final password = signupPasswordTextController.text;
    final confirmPassword = signupConfirmPasswordTextController.text;

    final isInputValid = validateSignupFields();

    if (!isInputValid) {
      state = state.copyWith(isLoading: false);
      return;
    }

    try {
      Map<String, dynamic> requestBody = {
        "first_name": firstName,
        "last_name": lastName,
        "email": email.toLowerCase(),
        "phone": phone,
        "password": password,
        "confirm_password": confirmPassword,
      };

      var (response, dioException) = await _networkApiService.postApiRequest(
        url: '${AppUrls.BASE_URL}${AppUrls.signup}',
        body: requestBody,
      );
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;
        if (jsonData['status'] == 200) {
          AppLog.log(jsonData.toString());
          showToastMessage(jsonData['message']);
          signupFirstNameTextController.clear();
          signupLastNameTextController.clear();
          signupEmailTextController.clear();
          signupContactNumberTextController.clear();
          signupPasswordTextController.clear();
          signupConfirmPasswordTextController.clear();
          voidCallback?.call();
        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> sendOTP(VoidCallback voidCallback) async {
    if (fpEmailTextController.text.isEmpty) {
      showToastMessage('Email Id is required');
      return;
    }
    else{
      state = state.copyWith(isLoading: false);
    }
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequest(
          url: '${AppUrls.BASE_URL}${'/user/forgot-password'}',
          body: {
            "email": fpEmailTextController.text,
          });
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;
        AppLog.log(jsonEncode(jsonData));
        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          voidCallback.call();
        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> resendOTP(VoidCallback voidCallback) async {
    if (fpEmailTextController.text.isEmpty) {
      showToastMessage('Email Id is required');
      return;
    }
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequest(
          url: '${AppUrls.BASE_URL}${'/user/resend-forgot-password-otp'}',
          body: {
            "email": fpEmailTextController.text,
          });
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;
        AppLog.log(jsonEncode(jsonData));
        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          voidCallback.call();
        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> verifyOTP(VoidCallback voidCallback) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequest(url: '${AppUrls.BASE_URL}${'/user/forget-password-otp-verification'}', body: {
        "email": fpEmailTextController.text,
        "otp": fpOtpTextController.text,
      });
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;

        if (response.statusCode == 200) {
          AppLog.log(jsonEncode(jsonData));
          showToastMessage(jsonData['message']);
          fpOtpTextController.clear();
          voidCallback.call();
        } else {
          showToastMessage(jsonData['message']);
          fpOtpTextController.text = '';
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  bool validatePassword() {
    if(fpPasswordTextController.text.length < 8 || fpPasswordTextController.text.length > 15 ) {
      showToastMessage('Password must be between 8 to 15 characters');
      return false;
    }else if(fpPasswordTextController.text != fpConfirmPasswordTextController.text) {
      showToastMessage('Passwords must be same');
      return false;
    }
    else {
      return true;
    }
  }

  Future<void> resetPassword(VoidCallback voidCallback) async {

    if(validatePassword()) {
      state = state.copyWith(isLoading: true);

      try {
        var (response, dioException) = await _networkApiService
            .postApiRequestWithToken(
            url: '${AppUrls.BASE_URL}${'/user/forget-password-change-password'}',
            body: {
              "email": fpEmailTextController.text,
              "new_password": fpPasswordTextController.text,
              "confirm_password": fpConfirmPasswordTextController.text,
            });
        state = state.copyWith(isLoading: false);

        if (response == null && dioException == null) {
          showConnectionWasInterruptedToastMessage();
        } else if (dioException != null) {
          showDioError(dioException);
        } else {
          Map<String, dynamic> jsonData = response.data;

          if (response.statusCode == 200) {
            showToastMessage(jsonData['message']);
            fpPasswordTextController.clear();
            fpConfirmPasswordTextController.clear();
            fpEmailTextController.clear();
            voidCallback.call();
          } else {
            showToastMessage(jsonData['message']);
          }
        }
      } catch (error) {
        state = state.copyWith(isLoading: false);
        showConnectionWasInterruptedToastMessage();
      }
    }

  }

}
