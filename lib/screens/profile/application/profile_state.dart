// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:for_the_table/model/user_profile/user_profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    @Default('') String profileImgPath,
    ProfileDetails? fetchedUser,
    @Default('') String profileImage,
    UserProfileModel? userProfileResponseModel,
  }) = _ProfileState;
  const ProfileState._();
}
