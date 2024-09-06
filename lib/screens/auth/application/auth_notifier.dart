import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/core/utils/validator.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/infrastructure/network_api_services.dart';
import '../../../core/utils/app_log.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._hiveDatabase, this._networkApiService) : super(const AuthState());

  final NetworkApiService _networkApiService;
  final HiveDatabase _hiveDatabase;

  String? get getUserId => _hiveDatabase.box.get(AppPreferenceKeys.userId);

  //login
  final TextEditingController loginEmailTextController = TextEditingController();
  final TextEditingController loginPasswordTextController = TextEditingController();

  //signup
  final TextEditingController signupEmailTextController = TextEditingController();
  final TextEditingController signupFirstNameTextController = TextEditingController();
  final TextEditingController signupLastNameTextController = TextEditingController();
  final TextEditingController signupContactNumberTextController = TextEditingController();
  final TextEditingController signupPasswordTextController = TextEditingController();
  final TextEditingController signupConfirmPasswordTextController = TextEditingController();

  //forgot-password
  final TextEditingController fpEmailTextController = TextEditingController();
  final TextEditingController fpOtpTextController = TextEditingController();
  final TextEditingController fpPasswordTextController = TextEditingController();
  final TextEditingController fpConfirmPasswordTextController = TextEditingController();

  //preference
  // final List preferences = [];
  Timer? timer;

  @override
  void dispose() {
    loginEmailTextController.dispose();
    loginPasswordTextController.dispose();
    signupEmailTextController.dispose();
    signupFirstNameTextController.dispose();
    signupLastNameTextController.dispose();
    signupContactNumberTextController.dispose();
    signupPasswordTextController.dispose();
    fpEmailTextController.dispose();
    fpOtpTextController.dispose();
    fpPasswordTextController.dispose();
    fpConfirmPasswordTextController.dispose();
    timer?.cancel();
    super.dispose();
  }

  void clearLoginPageFields() {
    loginEmailTextController.clear();
    loginPasswordTextController.clear();
  }

  void clearSignupPageFields() {
    signupFirstNameTextController.clear();
    signupLastNameTextController.clear();
    signupEmailTextController.clear();
    signupContactNumberTextController.clear();
    signupPasswordTextController.clear();
    signupConfirmPasswordTextController.clear();
  }

  bool validateLoginFields({VoidCallback? onSuccess}) {
    if (loginEmailTextController.text.isEmpty) {
      showToastMessage('Please enter your email');
      return false;
    } else if (!Validator.validateEmail(loginEmailTextController.text)) {
      showToastMessage('Please enter a valid email');
      return false;
    } else if (loginPasswordTextController.text.isEmpty) {
      showToastMessage('Please enter your password');
      return false;
    } else if (loginPasswordTextController.text.length < 8 ||
        loginPasswordTextController.text.length > 15) {
      showToastMessage('Password should be at between 8 to 15 characters');
      return false;
    } else {
      return true;
    }
  }

  bool validateSignupFields() {
    if (signupFirstNameTextController.text.isEmpty) {
      showToastMessage('Please enter your first name');
      return false;
    } else if (signupLastNameTextController.text.isEmpty) {
      showToastMessage('Please enter your last name');
      return false;
    } else if (signupEmailTextController.text.isEmpty) {
      showToastMessage('Please enter your email');
      return false;
    } else if (!Validator.validateEmail(signupEmailTextController.text)) {
      showToastMessage('Please enter a valid email');
      return false;
    }
    if (signupContactNumberTextController.text.isEmpty) {
      showToastMessage('Please enter your phone number');
      return false;
    } else if (signupContactNumberTextController.text.isEmpty ||
        signupContactNumberTextController.text.length < 10 ||
        !Validator.validatePhone(signupContactNumberTextController.text)) {
      showToastMessage('Please enter a valid phone number');
      return false;
    } else if (signupPasswordTextController.text.isEmpty) {
      showToastMessage('Please enter a password');
      return false;
    } else if (signupPasswordTextController.text.length < 8 ||
        signupPasswordTextController.text.length > 15) {
      showToastMessage('Password must be between 8 to 15 characters');
      return false;
    } else if (signupConfirmPasswordTextController.text.isEmpty) {
      showToastMessage('Please enter your confirm password');
      return false;
    } else if (signupPasswordTextController.text != signupConfirmPasswordTextController.text) {
      showToastMessage('Password and confirm password are different');
      return false;
    } else {
      return true;
    }
  }

  bool validateForgotEmailField() {
    if (fpEmailTextController.text.isEmpty) {
      showToastMessage('Please enter your registered email');
      return false;
    } else if (!Validator.validateEmail(fpEmailTextController.text)) {
      showToastMessage('Please enter a valid email');
      return false;
    }
    return true;
  }

  void _startTimer() {
    timer?.cancel();
    state = state.copyWith(canResendOtp: false, remainingTime: 30);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingTime <= 1) {
        state = state.copyWith(canResendOtp: true);
        timer.cancel();
      } else {
        state = state.copyWith(remainingTime: state.remainingTime - 1);
      }
    });
  }

  void resetTimer() {
    _startTimer();
  }

  Future<void> signIn(VoidCallback voidCallback) async {
    state = state.copyWith(isLoading: true);

    final isInputValid = validateLoginFields();

    if (!isInputValid) {
      state = state.copyWith(isLoading: false);
      return;
    }

    try {
      String? deviceType = Platform.isAndroid
          ? "android"
          : Platform.isIOS
              ? "ios"
              : "web";
      String? androidDeviceToken = await FirebaseMessaging.instance.getToken();
      String? iOSDeviceToken = await FirebaseMessaging.instance.getAPNSToken();
      AppLog.log("ios token : $iOSDeviceToken");
      AppLog.log("ios token : $androidDeviceToken");

      var (response, dioException) = await _networkApiService
          .postApiRequest(url: '${AppUrls.baseUrl}${AppUrls.signin}', body: {
        "email": loginEmailTextController.text.toLowerCase(),
        "password": loginPasswordTextController.text,
        "deviceType": deviceType,
        "deviceToken": (deviceType == "android") ? androidDeviceToken : iOSDeviceToken,
      });

      AppLog.log('response ----- $response');
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;
        if (response.statusCode == 200) {
          AppLog.log(jsonEncode(jsonData));

          _hiveDatabase.box.put(AppPreferenceKeys.token, jsonData['token'] ?? '');
          _hiveDatabase.box.put(AppPreferenceKeys.userId, jsonData['data']['_id'] ?? '');
          _hiveDatabase.box
              .put(AppPreferenceKeys.userFirstName, jsonData['data']['first_name'] ?? '');
          _hiveDatabase.box
              .put(AppPreferenceKeys.userLastName, jsonData['data']['last_name'] ?? '');
          _hiveDatabase.box.put(AppPreferenceKeys.fullName, jsonData['data']['fullName'] ?? '');
          _hiveDatabase.box.put(AppPreferenceKeys.userPhone, jsonData['data']['phone'] ?? '');
          _hiveDatabase.box.put(AppPreferenceKeys.userEmail, jsonData['data']['email'] ?? '');
          _hiveDatabase.box
              .put(AppPreferenceKeys.profileImage, jsonData['data']['profile_image'] ?? '');
          _hiveDatabase.box.put(AppPreferenceKeys.userCity, jsonData['data']['city'] ?? '');
          _hiveDatabase.box.put(AppPreferenceKeys.deviceToken,
              (deviceType == "android") ? androidDeviceToken : iOSDeviceToken);
          showToastMessage(jsonData["message"]);
          clearLoginPageFields();
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
      String? deviceType = Platform.isAndroid
          ? "android"
          : Platform.isIOS
              ? "ios"
              : "web";
      String? deviceToken = await FirebaseMessaging.instance.getToken();
      AppLog.log("Device token is $deviceToken");
      Map<String, dynamic> requestBody = {
        "first_name": firstName,
        "last_name": lastName,
        "email": email.toLowerCase(),
        "phone": phone,
        "password": password,
        "confirm_password": confirmPassword,
        "deviceType": deviceType,
        "deviceToken": deviceToken,
      };

      var (response, dioException) = await _networkApiService.postApiRequest(
        url: '${AppUrls.baseUrl}${AppUrls.signup}',
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
          showToastMessage(jsonData['message']);
          clearSignupPageFields();
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
    } else {
      state = state.copyWith(isLoading: false);
    }
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequest(url: '${AppUrls.baseUrl}${AppUrls.sendOTP}', body: {
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
      var (response, dioException) = await _networkApiService
          .postApiRequest(url: '${AppUrls.baseUrl}${AppUrls.resendOTP}', body: {
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
          .postApiRequest(url: '${AppUrls.baseUrl}${AppUrls.verifyOTP}', body: {
        "email": fpEmailTextController.text,
        "otp": fpOtpTextController.text,
      });
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
        fpOtpTextController.text = '';
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
    if (fpPasswordTextController.text.isEmpty) {
      showToastMessage('Please enter a new password');
      return false;
    } else if (fpPasswordTextController.text.length < 8 ||
        fpPasswordTextController.text.length > 15) {
      showToastMessage('Password must be between 8 to 15 characters');
      return false;
    } else if (fpConfirmPasswordTextController.text.isEmpty) {
      showToastMessage('Please enter your password again');
      return false;
    } else if (fpPasswordTextController.text != fpConfirmPasswordTextController.text) {
      showToastMessage('Password and confirm password are different');
      return false;
    } else {
      return true;
    }
  }

  Future<void> resetPassword(VoidCallback voidCallback) async {
    if (validatePassword()) {
      state = state.copyWith(isLoading: true);

      try {
        var (response, dioException) = await _networkApiService
            .postApiRequestWithToken(url: '${AppUrls.baseUrl}${AppUrls.resetPassword}', body: {
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
