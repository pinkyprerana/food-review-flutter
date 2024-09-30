// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoginLoading,
    @Default("") String userID,
    @Default(30) int remainingTime,
    @Default(false) bool canResendOtp,
  }) = _AuthState;
  const AuthState._();
}
