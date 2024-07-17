// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'location_state.freezed.dart';

@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState({
    @Default(false) bool isLoading,
    @Default(false) bool isLocationFetched,
  }) = _LocationState;
}
