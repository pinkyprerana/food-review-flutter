// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get profileImgPath => throw _privateConstructorUsedError;
  ProfileDetails? get fetchedUser => throw _privateConstructorUsedError;
  UserProfileModel? get userProfileResponseModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {bool isLoading,
      String profileImgPath,
      ProfileDetails? fetchedUser,
      UserProfileModel? userProfileResponseModel});

  $ProfileDetailsCopyWith<$Res>? get fetchedUser;
  $UserProfileModelCopyWith<$Res>? get userProfileResponseModel;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? profileImgPath = null,
    Object? fetchedUser = freezed,
    Object? userProfileResponseModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImgPath: null == profileImgPath
          ? _value.profileImgPath
          : profileImgPath // ignore: cast_nullable_to_non_nullable
              as String,
      fetchedUser: freezed == fetchedUser
          ? _value.fetchedUser
          : fetchedUser // ignore: cast_nullable_to_non_nullable
              as ProfileDetails?,
      userProfileResponseModel: freezed == userProfileResponseModel
          ? _value.userProfileResponseModel
          : userProfileResponseModel // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileDetailsCopyWith<$Res>? get fetchedUser {
    if (_value.fetchedUser == null) {
      return null;
    }

    return $ProfileDetailsCopyWith<$Res>(_value.fetchedUser!, (value) {
      return _then(_value.copyWith(fetchedUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res>? get userProfileResponseModel {
    if (_value.userProfileResponseModel == null) {
      return null;
    }

    return $UserProfileModelCopyWith<$Res>(_value.userProfileResponseModel!,
        (value) {
      return _then(_value.copyWith(userProfileResponseModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String profileImgPath,
      ProfileDetails? fetchedUser,
      UserProfileModel? userProfileResponseModel});

  @override
  $ProfileDetailsCopyWith<$Res>? get fetchedUser;
  @override
  $UserProfileModelCopyWith<$Res>? get userProfileResponseModel;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? profileImgPath = null,
    Object? fetchedUser = freezed,
    Object? userProfileResponseModel = freezed,
  }) {
    return _then(_$ProfileStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImgPath: null == profileImgPath
          ? _value.profileImgPath
          : profileImgPath // ignore: cast_nullable_to_non_nullable
              as String,
      fetchedUser: freezed == fetchedUser
          ? _value.fetchedUser
          : fetchedUser // ignore: cast_nullable_to_non_nullable
              as ProfileDetails?,
      userProfileResponseModel: freezed == userProfileResponseModel
          ? _value.userProfileResponseModel
          : userProfileResponseModel // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl extends _ProfileState {
  const _$ProfileStateImpl(
      {this.isLoading = false,
      this.profileImgPath = '',
      this.fetchedUser,
      this.userProfileResponseModel})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String profileImgPath;
  @override
  final ProfileDetails? fetchedUser;
  @override
  final UserProfileModel? userProfileResponseModel;

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, profileImgPath: $profileImgPath, fetchedUser: $fetchedUser, userProfileResponseModel: $userProfileResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.profileImgPath, profileImgPath) ||
                other.profileImgPath == profileImgPath) &&
            (identical(other.fetchedUser, fetchedUser) ||
                other.fetchedUser == fetchedUser) &&
            (identical(
                    other.userProfileResponseModel, userProfileResponseModel) ||
                other.userProfileResponseModel == userProfileResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, profileImgPath,
      fetchedUser, userProfileResponseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState extends ProfileState {
  const factory _ProfileState(
      {final bool isLoading,
      final String profileImgPath,
      final ProfileDetails? fetchedUser,
      final UserProfileModel? userProfileResponseModel}) = _$ProfileStateImpl;
  const _ProfileState._() : super._();

  @override
  bool get isLoading;
  @override
  String get profileImgPath;
  @override
  ProfileDetails? get fetchedUser;
  @override
  UserProfileModel? get userProfileResponseModel;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
