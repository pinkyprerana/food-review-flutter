import 'package:freezed_annotation/freezed_annotation.dart';
part 'yourPeople_state.freezed.dart';

@freezed
abstract class YourPeopleState with _$YourPeopleState {
  const factory YourPeopleState({
    @Default(0) int selectedIndex,
    @Default(false) bool isLoading
  }) = _YourPeopleState;
}