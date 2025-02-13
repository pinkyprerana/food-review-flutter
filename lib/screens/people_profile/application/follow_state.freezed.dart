// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FollowState {
  Map<String, bool> get userFollowStatus => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<DataOfPostListOfOtherModel> get postListOfOtherUser =>
      throw _privateConstructorUsedError;
  List<GeoLoc>? get coordinateList => throw _privateConstructorUsedError;
  List<UserInfo>? get userInfoList => throw _privateConstructorUsedError;
  List<PreferenceInfo>? get preferenceInfoList =>
      throw _privateConstructorUsedError;
  List<RestaurantInfo>? get restaurantInfoList =>
      throw _privateConstructorUsedError;
  List<DataOfOtherPeople>? get getDetails => throw _privateConstructorUsedError;
  OtherPeopleProfileModel? get otherPeopleProfile =>
      throw _privateConstructorUsedError;

  /// Create a copy of FollowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowStateCopyWith<FollowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowStateCopyWith<$Res> {
  factory $FollowStateCopyWith(
          FollowState value, $Res Function(FollowState) then) =
      _$FollowStateCopyWithImpl<$Res, FollowState>;
  @useResult
  $Res call(
      {Map<String, bool> userFollowStatus,
      bool isLoading,
      List<DataOfPostListOfOtherModel> postListOfOtherUser,
      List<GeoLoc>? coordinateList,
      List<UserInfo>? userInfoList,
      List<PreferenceInfo>? preferenceInfoList,
      List<RestaurantInfo>? restaurantInfoList,
      List<DataOfOtherPeople>? getDetails,
      OtherPeopleProfileModel? otherPeopleProfile});

  $OtherPeopleProfileModelCopyWith<$Res>? get otherPeopleProfile;
}

/// @nodoc
class _$FollowStateCopyWithImpl<$Res, $Val extends FollowState>
    implements $FollowStateCopyWith<$Res> {
  _$FollowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userFollowStatus = null,
    Object? isLoading = null,
    Object? postListOfOtherUser = null,
    Object? coordinateList = freezed,
    Object? userInfoList = freezed,
    Object? preferenceInfoList = freezed,
    Object? restaurantInfoList = freezed,
    Object? getDetails = freezed,
    Object? otherPeopleProfile = freezed,
  }) {
    return _then(_value.copyWith(
      userFollowStatus: null == userFollowStatus
          ? _value.userFollowStatus
          : userFollowStatus // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      postListOfOtherUser: null == postListOfOtherUser
          ? _value.postListOfOtherUser
          : postListOfOtherUser // ignore: cast_nullable_to_non_nullable
              as List<DataOfPostListOfOtherModel>,
      coordinateList: freezed == coordinateList
          ? _value.coordinateList
          : coordinateList // ignore: cast_nullable_to_non_nullable
              as List<GeoLoc>?,
      userInfoList: freezed == userInfoList
          ? _value.userInfoList
          : userInfoList // ignore: cast_nullable_to_non_nullable
              as List<UserInfo>?,
      preferenceInfoList: freezed == preferenceInfoList
          ? _value.preferenceInfoList
          : preferenceInfoList // ignore: cast_nullable_to_non_nullable
              as List<PreferenceInfo>?,
      restaurantInfoList: freezed == restaurantInfoList
          ? _value.restaurantInfoList
          : restaurantInfoList // ignore: cast_nullable_to_non_nullable
              as List<RestaurantInfo>?,
      getDetails: freezed == getDetails
          ? _value.getDetails
          : getDetails // ignore: cast_nullable_to_non_nullable
              as List<DataOfOtherPeople>?,
      otherPeopleProfile: freezed == otherPeopleProfile
          ? _value.otherPeopleProfile
          : otherPeopleProfile // ignore: cast_nullable_to_non_nullable
              as OtherPeopleProfileModel?,
    ) as $Val);
  }

  /// Create a copy of FollowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OtherPeopleProfileModelCopyWith<$Res>? get otherPeopleProfile {
    if (_value.otherPeopleProfile == null) {
      return null;
    }

    return $OtherPeopleProfileModelCopyWith<$Res>(_value.otherPeopleProfile!,
        (value) {
      return _then(_value.copyWith(otherPeopleProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowStateImplCopyWith<$Res>
    implements $FollowStateCopyWith<$Res> {
  factory _$$FollowStateImplCopyWith(
          _$FollowStateImpl value, $Res Function(_$FollowStateImpl) then) =
      __$$FollowStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, bool> userFollowStatus,
      bool isLoading,
      List<DataOfPostListOfOtherModel> postListOfOtherUser,
      List<GeoLoc>? coordinateList,
      List<UserInfo>? userInfoList,
      List<PreferenceInfo>? preferenceInfoList,
      List<RestaurantInfo>? restaurantInfoList,
      List<DataOfOtherPeople>? getDetails,
      OtherPeopleProfileModel? otherPeopleProfile});

  @override
  $OtherPeopleProfileModelCopyWith<$Res>? get otherPeopleProfile;
}

/// @nodoc
class __$$FollowStateImplCopyWithImpl<$Res>
    extends _$FollowStateCopyWithImpl<$Res, _$FollowStateImpl>
    implements _$$FollowStateImplCopyWith<$Res> {
  __$$FollowStateImplCopyWithImpl(
      _$FollowStateImpl _value, $Res Function(_$FollowStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userFollowStatus = null,
    Object? isLoading = null,
    Object? postListOfOtherUser = null,
    Object? coordinateList = freezed,
    Object? userInfoList = freezed,
    Object? preferenceInfoList = freezed,
    Object? restaurantInfoList = freezed,
    Object? getDetails = freezed,
    Object? otherPeopleProfile = freezed,
  }) {
    return _then(_$FollowStateImpl(
      userFollowStatus: null == userFollowStatus
          ? _value._userFollowStatus
          : userFollowStatus // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      postListOfOtherUser: null == postListOfOtherUser
          ? _value._postListOfOtherUser
          : postListOfOtherUser // ignore: cast_nullable_to_non_nullable
              as List<DataOfPostListOfOtherModel>,
      coordinateList: freezed == coordinateList
          ? _value._coordinateList
          : coordinateList // ignore: cast_nullable_to_non_nullable
              as List<GeoLoc>?,
      userInfoList: freezed == userInfoList
          ? _value._userInfoList
          : userInfoList // ignore: cast_nullable_to_non_nullable
              as List<UserInfo>?,
      preferenceInfoList: freezed == preferenceInfoList
          ? _value._preferenceInfoList
          : preferenceInfoList // ignore: cast_nullable_to_non_nullable
              as List<PreferenceInfo>?,
      restaurantInfoList: freezed == restaurantInfoList
          ? _value._restaurantInfoList
          : restaurantInfoList // ignore: cast_nullable_to_non_nullable
              as List<RestaurantInfo>?,
      getDetails: freezed == getDetails
          ? _value._getDetails
          : getDetails // ignore: cast_nullable_to_non_nullable
              as List<DataOfOtherPeople>?,
      otherPeopleProfile: freezed == otherPeopleProfile
          ? _value.otherPeopleProfile
          : otherPeopleProfile // ignore: cast_nullable_to_non_nullable
              as OtherPeopleProfileModel?,
    ));
  }
}

/// @nodoc

class _$FollowStateImpl implements _FollowState {
  const _$FollowStateImpl(
      {final Map<String, bool> userFollowStatus = const {},
      this.isLoading = false,
      final List<DataOfPostListOfOtherModel> postListOfOtherUser = const [],
      final List<GeoLoc>? coordinateList = const [],
      final List<UserInfo>? userInfoList = const [],
      final List<PreferenceInfo>? preferenceInfoList = const [],
      final List<RestaurantInfo>? restaurantInfoList = const [],
      final List<DataOfOtherPeople>? getDetails,
      this.otherPeopleProfile})
      : _userFollowStatus = userFollowStatus,
        _postListOfOtherUser = postListOfOtherUser,
        _coordinateList = coordinateList,
        _userInfoList = userInfoList,
        _preferenceInfoList = preferenceInfoList,
        _restaurantInfoList = restaurantInfoList,
        _getDetails = getDetails;

  final Map<String, bool> _userFollowStatus;
  @override
  @JsonKey()
  Map<String, bool> get userFollowStatus {
    if (_userFollowStatus is EqualUnmodifiableMapView) return _userFollowStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userFollowStatus);
  }

  @override
  @JsonKey()
  final bool isLoading;
  final List<DataOfPostListOfOtherModel> _postListOfOtherUser;
  @override
  @JsonKey()
  List<DataOfPostListOfOtherModel> get postListOfOtherUser {
    if (_postListOfOtherUser is EqualUnmodifiableListView)
      return _postListOfOtherUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postListOfOtherUser);
  }

  final List<GeoLoc>? _coordinateList;
  @override
  @JsonKey()
  List<GeoLoc>? get coordinateList {
    final value = _coordinateList;
    if (value == null) return null;
    if (_coordinateList is EqualUnmodifiableListView) return _coordinateList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserInfo>? _userInfoList;
  @override
  @JsonKey()
  List<UserInfo>? get userInfoList {
    final value = _userInfoList;
    if (value == null) return null;
    if (_userInfoList is EqualUnmodifiableListView) return _userInfoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PreferenceInfo>? _preferenceInfoList;
  @override
  @JsonKey()
  List<PreferenceInfo>? get preferenceInfoList {
    final value = _preferenceInfoList;
    if (value == null) return null;
    if (_preferenceInfoList is EqualUnmodifiableListView)
      return _preferenceInfoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RestaurantInfo>? _restaurantInfoList;
  @override
  @JsonKey()
  List<RestaurantInfo>? get restaurantInfoList {
    final value = _restaurantInfoList;
    if (value == null) return null;
    if (_restaurantInfoList is EqualUnmodifiableListView)
      return _restaurantInfoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DataOfOtherPeople>? _getDetails;
  @override
  List<DataOfOtherPeople>? get getDetails {
    final value = _getDetails;
    if (value == null) return null;
    if (_getDetails is EqualUnmodifiableListView) return _getDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final OtherPeopleProfileModel? otherPeopleProfile;

  @override
  String toString() {
    return 'FollowState(userFollowStatus: $userFollowStatus, isLoading: $isLoading, postListOfOtherUser: $postListOfOtherUser, coordinateList: $coordinateList, userInfoList: $userInfoList, preferenceInfoList: $preferenceInfoList, restaurantInfoList: $restaurantInfoList, getDetails: $getDetails, otherPeopleProfile: $otherPeopleProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowStateImpl &&
            const DeepCollectionEquality()
                .equals(other._userFollowStatus, _userFollowStatus) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._postListOfOtherUser, _postListOfOtherUser) &&
            const DeepCollectionEquality()
                .equals(other._coordinateList, _coordinateList) &&
            const DeepCollectionEquality()
                .equals(other._userInfoList, _userInfoList) &&
            const DeepCollectionEquality()
                .equals(other._preferenceInfoList, _preferenceInfoList) &&
            const DeepCollectionEquality()
                .equals(other._restaurantInfoList, _restaurantInfoList) &&
            const DeepCollectionEquality()
                .equals(other._getDetails, _getDetails) &&
            (identical(other.otherPeopleProfile, otherPeopleProfile) ||
                other.otherPeopleProfile == otherPeopleProfile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_userFollowStatus),
      isLoading,
      const DeepCollectionEquality().hash(_postListOfOtherUser),
      const DeepCollectionEquality().hash(_coordinateList),
      const DeepCollectionEquality().hash(_userInfoList),
      const DeepCollectionEquality().hash(_preferenceInfoList),
      const DeepCollectionEquality().hash(_restaurantInfoList),
      const DeepCollectionEquality().hash(_getDetails),
      otherPeopleProfile);

  /// Create a copy of FollowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowStateImplCopyWith<_$FollowStateImpl> get copyWith =>
      __$$FollowStateImplCopyWithImpl<_$FollowStateImpl>(this, _$identity);
}

abstract class _FollowState implements FollowState {
  const factory _FollowState(
      {final Map<String, bool> userFollowStatus,
      final bool isLoading,
      final List<DataOfPostListOfOtherModel> postListOfOtherUser,
      final List<GeoLoc>? coordinateList,
      final List<UserInfo>? userInfoList,
      final List<PreferenceInfo>? preferenceInfoList,
      final List<RestaurantInfo>? restaurantInfoList,
      final List<DataOfOtherPeople>? getDetails,
      final OtherPeopleProfileModel? otherPeopleProfile}) = _$FollowStateImpl;

  @override
  Map<String, bool> get userFollowStatus;
  @override
  bool get isLoading;
  @override
  List<DataOfPostListOfOtherModel> get postListOfOtherUser;
  @override
  List<GeoLoc>? get coordinateList;
  @override
  List<UserInfo>? get userInfoList;
  @override
  List<PreferenceInfo>? get preferenceInfoList;
  @override
  List<RestaurantInfo>? get restaurantInfoList;
  @override
  List<DataOfOtherPeople>? get getDetails;
  @override
  OtherPeopleProfileModel? get otherPeopleProfile;

  /// Create a copy of FollowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowStateImplCopyWith<_$FollowStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
