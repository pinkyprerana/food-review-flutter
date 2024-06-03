// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState with _$BaseState {
  const factory BaseState({
    @Default(false) bool isLoading,
    @Default(0) int bottomNavIndex,
    @Default(0) int lastBottomNavIndex,
  }) = _BaseState;
  const BaseState._();
}
