// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yourPeople_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$YourPeopleState {
  int get selectedIndex => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $YourPeopleStateCopyWith<YourPeopleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YourPeopleStateCopyWith<$Res> {
  factory $YourPeopleStateCopyWith(
          YourPeopleState value, $Res Function(YourPeopleState) then) =
      _$YourPeopleStateCopyWithImpl<$Res, YourPeopleState>;
  @useResult
  $Res call({int selectedIndex, bool isLoading});
}

/// @nodoc
class _$YourPeopleStateCopyWithImpl<$Res, $Val extends YourPeopleState>
    implements $YourPeopleStateCopyWith<$Res> {
  _$YourPeopleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YourPeopleStateImplCopyWith<$Res>
    implements $YourPeopleStateCopyWith<$Res> {
  factory _$$YourPeopleStateImplCopyWith(_$YourPeopleStateImpl value,
          $Res Function(_$YourPeopleStateImpl) then) =
      __$$YourPeopleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedIndex, bool isLoading});
}

/// @nodoc
class __$$YourPeopleStateImplCopyWithImpl<$Res>
    extends _$YourPeopleStateCopyWithImpl<$Res, _$YourPeopleStateImpl>
    implements _$$YourPeopleStateImplCopyWith<$Res> {
  __$$YourPeopleStateImplCopyWithImpl(
      _$YourPeopleStateImpl _value, $Res Function(_$YourPeopleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? isLoading = null,
  }) {
    return _then(_$YourPeopleStateImpl(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$YourPeopleStateImpl implements _YourPeopleState {
  const _$YourPeopleStateImpl({this.selectedIndex = 0, this.isLoading = false});

  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'YourPeopleState(selectedIndex: $selectedIndex, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YourPeopleStateImpl &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YourPeopleStateImplCopyWith<_$YourPeopleStateImpl> get copyWith =>
      __$$YourPeopleStateImplCopyWithImpl<_$YourPeopleStateImpl>(
          this, _$identity);
}

abstract class _YourPeopleState implements YourPeopleState {
  const factory _YourPeopleState(
      {final int selectedIndex, final bool isLoading}) = _$YourPeopleStateImpl;

  @override
  int get selectedIndex;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$YourPeopleStateImplCopyWith<_$YourPeopleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
