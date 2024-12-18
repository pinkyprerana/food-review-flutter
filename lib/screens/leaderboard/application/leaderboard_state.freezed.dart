// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LeaderboardState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<LeaderboardDetail> get leaderboardList =>
      throw _privateConstructorUsedError;
  int get totalStandings => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardStateCopyWith<LeaderboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardStateCopyWith<$Res> {
  factory $LeaderboardStateCopyWith(
          LeaderboardState value, $Res Function(LeaderboardState) then) =
      _$LeaderboardStateCopyWithImpl<$Res, LeaderboardState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<LeaderboardDetail> leaderboardList,
      int totalStandings,
      int currentPage,
      int totalPages});
}

/// @nodoc
class _$LeaderboardStateCopyWithImpl<$Res, $Val extends LeaderboardState>
    implements $LeaderboardStateCopyWith<$Res> {
  _$LeaderboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? leaderboardList = null,
    Object? totalStandings = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      leaderboardList: null == leaderboardList
          ? _value.leaderboardList
          : leaderboardList // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardDetail>,
      totalStandings: null == totalStandings
          ? _value.totalStandings
          : totalStandings // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardStateImplCopyWith<$Res>
    implements $LeaderboardStateCopyWith<$Res> {
  factory _$$LeaderboardStateImplCopyWith(_$LeaderboardStateImpl value,
          $Res Function(_$LeaderboardStateImpl) then) =
      __$$LeaderboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<LeaderboardDetail> leaderboardList,
      int totalStandings,
      int currentPage,
      int totalPages});
}

/// @nodoc
class __$$LeaderboardStateImplCopyWithImpl<$Res>
    extends _$LeaderboardStateCopyWithImpl<$Res, _$LeaderboardStateImpl>
    implements _$$LeaderboardStateImplCopyWith<$Res> {
  __$$LeaderboardStateImplCopyWithImpl(_$LeaderboardStateImpl _value,
      $Res Function(_$LeaderboardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? leaderboardList = null,
    Object? totalStandings = null,
    Object? currentPage = null,
    Object? totalPages = null,
  }) {
    return _then(_$LeaderboardStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      leaderboardList: null == leaderboardList
          ? _value._leaderboardList
          : leaderboardList // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardDetail>,
      totalStandings: null == totalStandings
          ? _value.totalStandings
          : totalStandings // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LeaderboardStateImpl extends _LeaderboardState {
  const _$LeaderboardStateImpl(
      {this.isLoading = false,
      final List<LeaderboardDetail> leaderboardList = const [],
      this.totalStandings = 0,
      this.currentPage = 0,
      this.totalPages = 0})
      : _leaderboardList = leaderboardList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<LeaderboardDetail> _leaderboardList;
  @override
  @JsonKey()
  List<LeaderboardDetail> get leaderboardList {
    if (_leaderboardList is EqualUnmodifiableListView) return _leaderboardList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leaderboardList);
  }

  @override
  @JsonKey()
  final int totalStandings;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int totalPages;

  @override
  String toString() {
    return 'LeaderboardState(isLoading: $isLoading, leaderboardList: $leaderboardList, totalStandings: $totalStandings, currentPage: $currentPage, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._leaderboardList, _leaderboardList) &&
            (identical(other.totalStandings, totalStandings) ||
                other.totalStandings == totalStandings) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_leaderboardList),
      totalStandings,
      currentPage,
      totalPages);

  /// Create a copy of LeaderboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardStateImplCopyWith<_$LeaderboardStateImpl> get copyWith =>
      __$$LeaderboardStateImplCopyWithImpl<_$LeaderboardStateImpl>(
          this, _$identity);
}

abstract class _LeaderboardState extends LeaderboardState {
  const factory _LeaderboardState(
      {final bool isLoading,
      final List<LeaderboardDetail> leaderboardList,
      final int totalStandings,
      final int currentPage,
      final int totalPages}) = _$LeaderboardStateImpl;
  const _LeaderboardState._() : super._();

  @override
  bool get isLoading;
  @override
  List<LeaderboardDetail> get leaderboardList;
  @override
  int get totalStandings;
  @override
  int get currentPage;
  @override
  int get totalPages;

  /// Create a copy of LeaderboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardStateImplCopyWith<_$LeaderboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
