// ignore_for_file: parameter_assignments, empty_catches

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/auth/application/auth_state.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/core/utils/validator.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._dio, this._hiveDatabase) : super(const AuthState());

  final Dio _dio;
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

  final TextEditingController otpTextController = TextEditingController();
  final TextEditingController fpEmailTextController = TextEditingController();
  final TextEditingController fpOtpTextController = TextEditingController();

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
  }

  void login({VoidCallback? onSuccess}) {
    if (loginEmailTextController.text.isEmpty) {
      showToastMessage('Please enter email');
      return;
    } else if (!Validator.validateEmail(loginEmailTextController.text)) {
      showToastMessage('Please enter valid email');
      return;
    } else if (loginPasswordTextController.text.isEmpty) {
      showToastMessage('Please enter password');
      return;
    } else if (loginPasswordTextController.text.length < 6) {
      showToastMessage('Password should be alteast 6 characters');
      return;
    }

    onSuccess?.call();
  }

  void register({VoidCallback? onSuccess}) {
    if (signupFirstNameTextController.text.isEmpty) {
      showToastMessage('Please enter first name');
      return;
    } else if (signupLastNameTextController.text.isEmpty) {
      showToastMessage('Please enter last name');
      return;
    } else if (!Validator.validateEmail(signupEmailTextController.text)) {
      showToastMessage('Please enter valid email');
      return;
    } else if (signupContactNumberTextController.text.isEmpty) {
      showToastMessage('Please enter contact number');
      return;
    } else if (signupContactNumberTextController.text.length < 8) {
      showToastMessage('Please enter a valid contact number');
      return;
    }

    onSuccess?.call();
  }
}
