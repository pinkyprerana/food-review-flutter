import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_state.freezed.dart';

@freezed
class ListState with _$ListState {
  const factory ListState({
    @Default(false) bool isLoading,
    @Default(0) int listIndex,
    @Default(0) int mapViewIndex,
  }) = _ListState;
  const ListState._();
}
