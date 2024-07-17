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
  bool get isBeingSubmitted => throw _privateConstructorUsedError;
  String get profileImgPath => throw _privateConstructorUsedError;
  ProfileDetails? get fetchedUser => throw _privateConstructorUsedError;
  String get profileImage => throw _privateConstructorUsedError;
  UserProfileModel? get userProfileResponseModel =>
      throw _privateConstructorUsedError;
  List<Activity>? get userActivitiesList => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  dynamic get isMoreDataFetchable => throw _privateConstructorUsedError;

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
      bool isBeingSubmitted,
      String profileImgPath,
      ProfileDetails? fetchedUser,
      String profileImage,
      UserProfileModel? userProfileResponseModel,
      List<Activity>? userActivitiesList,
      int currentPage,
      int totalPages,
      dynamic isMoreDataFetchable});

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
    Object? isBeingSubmitted = null,
    Object? profileImgPath = null,
    Object? fetchedUser = freezed,
    Object? profileImage = null,
    Object? userProfileResponseModel = freezed,
    Object? userActivitiesList = freezed,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? isMoreDataFetchable = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBeingSubmitted: null == isBeingSubmitted
          ? _value.isBeingSubmitted
          : isBeingSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImgPath: null == profileImgPath
          ? _value.profileImgPath
          : profileImgPath // ignore: cast_nullable_to_non_nullable
              as String,
      fetchedUser: freezed == fetchedUser
          ? _value.fetchedUser
          : fetchedUser // ignore: cast_nullable_to_non_nullable
              as ProfileDetails?,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileResponseModel: freezed == userProfileResponseModel
          ? _value.userProfileResponseModel
          : userProfileResponseModel // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      userActivitiesList: freezed == userActivitiesList
          ? _value.userActivitiesList
          : userActivitiesList // ignore: cast_nullable_to_non_nullable
              as List<Activity>?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      isMoreDataFetchable: freezed == isMoreDataFetchable
          ? _value.isMoreDataFetchable
          : isMoreDataFetchable // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      bool isBeingSubmitted,
      String profileImgPath,
      ProfileDetails? fetchedUser,
      String profileImage,
      UserProfileModel? userProfileResponseModel,
      List<Activity>? userActivitiesList,
      int currentPage,
      int totalPages,
      dynamic isMoreDataFetchable});

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
    Object? isBeingSubmitted = null,
    Object? profileImgPath = null,
    Object? fetchedUser = freezed,
    Object? profileImage = null,
    Object? userProfileResponseModel = freezed,
    Object? userActivitiesList = freezed,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? isMoreDataFetchable = freezed,
  }) {
    return _then(_$ProfileStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBeingSubmitted: null == isBeingSubmitted
          ? _value.isBeingSubmitted
          : isBeingSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImgPath: null == profileImgPath
          ? _value.profileImgPath
          : profileImgPath // ignore: cast_nullable_to_non_nullable
              as String,
      fetchedUser: freezed == fetchedUser
          ? _value.fetchedUser
          : fetchedUser // ignore: cast_nullable_to_non_nullable
              as ProfileDetails?,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileResponseModel: freezed == userProfileResponseModel
          ? _value.userProfileResponseModel
          : userProfileResponseModel // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      userActivitiesList: freezed == userActivitiesList
          ? _value._userActivitiesList
          : userActivitiesList // ignore: cast_nullable_to_non_nullable
              as List<Activity>?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      isMoreDataFetchable: freezed == isMoreDataFetchable
          ? _value.isMoreDataFetchable!
          : isMoreDataFetchable,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl extends _ProfileState {
  const _$ProfileStateImpl(
      {this.isLoading = false,
      this.isBeingSubmitted = false,
      this.profileImgPath = '',
      this.fetchedUser,
      this.profileImage = '',
      this.userProfileResponseModel,
      final List<Activity>? userActivitiesList,
      this.currentPage = 1,
      this.totalPages = 1,
      this.isMoreDataFetchable = true})
      : _userActivitiesList = userActivitiesList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isBeingSubmitted;
  @override
  @JsonKey()
  final String profileImgPath;
  @override
  final ProfileDetails? fetchedUser;
  @override
  @JsonKey()
  final String profileImage;
  @override
  final UserProfileModel? userProfileResponseModel;
  final List<Activity>? _userActivitiesList;
  @override
  List<Activity>? get userActivitiesList {
    final value = _userActivitiesList;
    if (value == null) return null;
    if (_userActivitiesList is EqualUnmodifiableListView)
      return _userActivitiesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final dynamic isMoreDataFetchable;

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, isBeingSubmitted: $isBeingSubmitted, profileImgPath: $profileImgPath, fetchedUser: $fetchedUser, profileImage: $profileImage, userProfileResponseModel: $userProfileResponseModel, userActivitiesList: $userActivitiesList, currentPage: $currentPage, totalPages: $totalPages, isMoreDataFetchable: $isMoreDataFetchable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isBeingSubmitted, isBeingSubmitted) ||
                other.isBeingSubmitted == isBeingSubmitted) &&
            (identical(other.profileImgPath, profileImgPath) ||
                other.profileImgPath == profileImgPath) &&
            (identical(other.fetchedUser, fetchedUser) ||
                other.fetchedUser == fetchedUser) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(
                    other.userProfileResponseModel, userProfileResponseModel) ||
                other.userProfileResponseModel == userProfileResponseModel) &&
            const DeepCollectionEquality()
                .equals(other._userActivitiesList, _userActivitiesList) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality()
                .equals(other.isMoreDataFetchable, isMoreDataFetchable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isBeingSubmitted,
      profileImgPath,
      fetchedUser,
      profileImage,
      userProfileResponseModel,
      const DeepCollectionEquality().hash(_userActivitiesList),
      currentPage,
      totalPages,
      const DeepCollectionEquality().hash(isMoreDataFetchable));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState extends ProfileState {
  const factory _ProfileState(
      {final bool isLoading,
      final bool isBeingSubmitted,
      final String profileImgPath,
      final ProfileDetails? fetchedUser,
      final String profileImage,
      final UserProfileModel? userProfileResponseModel,
      final List<Activity>? userActivitiesList,
      final int currentPage,
      final int totalPages,
      final dynamic isMoreDataFetchable}) = _$ProfileStateImpl;
  const _ProfileState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isBeingSubmitted;
  @override
  String get profileImgPath;
  @override
  ProfileDetails? get fetchedUser;
  @override
  String get profileImage;
  @override
  UserProfileModel? get userProfileResponseModel;
  @override
  List<Activity>? get userActivitiesList;
  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  dynamic get isMoreDataFetchable;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
