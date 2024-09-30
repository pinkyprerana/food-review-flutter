// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/preference_model.dart';
part 'preference_state.freezed.dart';

@freezed
abstract class PreferenceState with _$PreferenceState {
  const factory PreferenceState({
    @Default(false) bool isLoading,
    @Default(0) int status,
    @Default('') String type,
    @Default('') String message,
    @Default([]) List<PreferenceList>? data,
    @Default([]) List<String> tags,
  }) = _PreferenceState;
}
