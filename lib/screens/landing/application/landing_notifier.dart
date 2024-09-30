import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/screens/landing/application/landing_state.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:http/http.dart' as http;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LandingNotifier extends StateNotifier<LandingState> {
  LandingNotifier(this._dio, this._hiveDatabase) : super(const LandingState());

  // ignore: unused_field
  final Dio _dio;
  // ignore: unused_field
  final HiveDatabase _hiveDatabase;

  String generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<String> getDeviceToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    return token ?? '';
  }

  String deviceType() {
    if (Platform.isAndroid) {
      return 'Android';
    } else {
      return 'iOS';
    }
  }

  Future<void> signInWithApple({required VoidCallback voidCallback}) async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final deviceToken = await getDeviceToken();
    // String? iOSDeviceToken = await FirebaseMessaging.instance.getAPNSToken();

    try {
      state = state.copyWith(isLoading: true);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final fixDisplayNameFromApple = [
        appleCredential.givenName ?? '',
        appleCredential.familyName ?? '',
      ].join(' ').trim();

      final user = await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      if (FirebaseAuth.instance.currentUser?.displayName == null) {
        await FirebaseAuth.instance.currentUser?.updateDisplayName(fixDisplayNameFromApple);
        FirebaseAuth.instance.currentUser?.reload();
      }

      if (user.user != null) {
        Map<String, dynamic> requestdata = {
          "fullName": user.user?.displayName ?? (appleCredential.givenName ?? 'user'),
          "email": user.user?.email,
          "socialId": user.user?.uid,
          "registerType": "Apple",
          "deviceToken": deviceToken,
          "deviceType": Platform.isAndroid ? "android" : "ios",
        };

        var headers = {
          'Accept': '*/*',
          'Content-Type': 'application/json',
        };

        _dio.options.headers.addAll(headers);

        final response =
            await _dio.post('${AppUrls.baseUrl}${AppUrls.socialLogin}', data: requestdata);
        // await _dio.post(
        //   '${AppUrls.baseUrl}${AppUrls.socialLogin}',
        //   data: requestdata,
        // );

        if (response.statusCode == 200) {
          Map<String, dynamic> jsonData = response.data;

          _hiveDatabase.box.put(AppPreferenceKeys.userId, jsonData['data']['_id'] ?? '');
          _hiveDatabase.box.put(AppPreferenceKeys.token, jsonData['token'] ?? '');

          voidCallback.call();
          state = state.copyWith(isLoading: false);
        } else {
          final message = response.data?['message'] as String?;
          showToastMessage(message ?? '');
          state = state.copyWith(isLoading: false);
        }
      } else {
        showToastMessage('Unable to login');
      }

      state = state.copyWith(isLoading: false);
    } catch (e) {
      AppLog.log(e.toString());
      showToastMessage('Unable to login');
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> signInWithGoogle({required VoidCallback voidCallback}) async {
    state = state.copyWith(isLoading: true);

    final deviceToken = await getDeviceToken();

    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignIn googleSignIn = GoogleSignIn();

      await googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential = await auth.signInWithCredential(credential);
        debugPrint("userCredential : $userCredential");
        if (userCredential.user != null) {
          Map<String, dynamic> requestdata = {
            "fullName": userCredential.user?.displayName,
            "socialId": userCredential.user?.uid,
            "email": userCredential.user?.email,
            "registerType": "Google",
            "deviceToken": deviceToken,
            "deviceType": Platform.isAndroid ? "android" : "ios",
          };

          debugPrint(requestdata.toString());

          final response =
              await _dio.post('${AppUrls.baseUrl}${AppUrls.socialLogin}', data: requestdata);

          if (response.statusCode == 200 && response.data.isNotEmpty) {
            Map<String, dynamic> jsonData = response.data;

            _hiveDatabase.box.put(AppPreferenceKeys.userId, jsonData['data']['_id'] ?? '');
            _hiveDatabase.box.put(AppPreferenceKeys.token, jsonData['token'] ?? '');
            // print(response);
            voidCallback.call();
          } else if (response.statusCode == 400) {
            showToastMessage('Google is not responding. Please try a different method');
          }else if (response.statusCode == 403) {
            showToastMessage("Try Facebook sign-in. An account already exists with the same email address but using Facebook sign-in.");
          }
        } else {
          showToastMessage('Something went wrong. Please try again.');
          state = state.copyWith(isLoading: false);
        }
      } else {
        // showToastMessage('Something went wrong. Please try again.');
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signInWithFacebook({required VoidCallback voidCallback}) async {
    state = state.copyWith(isLoading: true);

    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final deviceToken = await getDeviceToken();

    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      OAuthCredential facebookAuthCredential;

      // if (Platform.isIOS) {
      //   final status = await Permission.appTrackingTransparency.request();
      //   if (status == PermissionStatus.granted) {
      //     await FacebookAuth.i.autoLogAppEventsEnabled(true);
      //     print("isAutoLogAppEventsEnabled:: ${await FacebookAuth.i.isAutoLogAppEventsEnabled}");
      //   } else if (status == PermissionStatus.permanentlyDenied) {
      //     await openAppSettings();
      //   }
      // }

      final LoginResult loginResult = await FacebookAuth.instance
          .login(
        // permissions: ['email'],
        loginTracking: LoginTracking.limited,
        nonce: nonce,
        // loginBehavior: LoginBehavior.nativeOnly,
      )
          .catchError((onError) {
        if (kDebugMode) {
          print(onError);
        }
        throw Exception(onError.message);
      });

      if (loginResult.accessToken == null) {
        throw Exception(loginResult.message);
      }

      if (Platform.isIOS) {
        switch (loginResult.accessToken!.type) {
          case AccessTokenType.classic:
            final token = loginResult.accessToken as ClassicToken;
            facebookAuthCredential = FacebookAuthProvider.credential(
              token.authenticationToken!,
            );
            break;
          case AccessTokenType.limited:
            final token = loginResult.accessToken as LimitedToken;
            facebookAuthCredential = OAuthCredential(
              providerId: 'facebook.com',
              signInMethod: 'oauth',
              idToken: token.tokenString,
              rawNonce: rawNonce,
            );
            break;
        }
      } else {
        facebookAuthCredential = FacebookAuthProvider.credential(
          loginResult.accessToken!.tokenString,
        );
      }

      if (loginResult.status == LoginStatus.success) {
        // final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(
        //   loginResult.accessToken?.tokenString ?? '',
        // );

        final UserCredential userCredential =
            await auth.signInWithCredential(facebookAuthCredential);

        if (userCredential.user != null) {
          Map<String, dynamic> requestBody = {
            "fullName": userCredential.user?.displayName,
            "socialId": userCredential.user?.uid,
            "email": userCredential.user?.email,
            "registerType": "Facebook",
            "deviceToken": deviceToken,
            "deviceType": Platform.isAndroid ? "android" : "ios",
          };

          final response =
              await _dio.post('${AppUrls.baseUrl}${AppUrls.socialLogin}', data: requestBody);

          if (response.statusCode == 200 && response.data != null) {
            Map<String, dynamic> jsonData = response.data;

            _hiveDatabase.box.put(AppPreferenceKeys.userId, jsonData['data']['_id'] ?? '');
            _hiveDatabase.box.put(AppPreferenceKeys.token, jsonData['token'] ?? '');

            voidCallback.call();
          }
        } else {
          showToastMessage('Something went wrong. Please try again.');
          state = state.copyWith(isLoading: false);
        }
      } else {
        showToastMessage('Facebook login failed. Please try again.');
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      debugPrint(e.toString());
      showToastMessage("Try Google sign-in. An account already exists with the same email address but using Google sign-in.");
      // handle the error here
    }
  }
}
