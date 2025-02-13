import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../model/notification_model/notification_model.dart';
part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(false) bool isLoading,
    @Default([]) List<NotificationData> notificationList,
    @Default([]) List<NotificationData> todayNotifications,
    @Default([]) List<NotificationData> yesterdayNotifications,
    @Default([]) List<NotificationData> olderNotifications,
    @Default(0) int totalNotifications,
    @Default(0) int currentPage,
    @Default(0) int totalPages,
  }) = _NotificationState;
  const NotificationState._();
}
