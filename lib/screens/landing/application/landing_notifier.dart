import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/screens/landing/application/landing_state.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LandingNotifier extends StateNotifier<LandingState> {
  LandingNotifier(this._dio, this._hiveDatabase) : super(const LandingState());

  // ignore: unused_field
  final Dio _dio;
  // ignore: unused_field
  final HiveDatabase _hiveDatabase;

  Future<void> signInWithGoogle({
    required VoidCallback voidCallback,
  }) async {
    state = state.copyWith(isLoading: true);

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

        if (userCredential.user != null) {
          Map<String, dynamic> requestBody = {
            "fullName": userCredential.user?.displayName,
            "socialId": userCredential.user?.uid,
            "email": userCredential.user?.email,
            "registerType": "Google"
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
        // showToastMessage('Something went wrong. Please try again.');
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      debugPrint(e.toString());
      // handle the error here
    }
  }
}
