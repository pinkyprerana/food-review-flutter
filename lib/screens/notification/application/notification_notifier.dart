// ignore_for_file: parameter_assignments, empty_catches
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/infrastructure/hive_database.dart';
import '../../../core/utils/toast.dart';
import '../../../model/notification_model/notification_model.dart';
import 'notification_state.dart';

class NotificationNotifier extends StateNotifier<NotificationState> {
  NotificationNotifier( this._networkApiService) : super(const NotificationState());

  final NetworkApiService _networkApiService;


  Future<void> getNotificationList() async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.BASE_URL}${'/notification/list'}',
      );
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        NotificationModel notificationModel = NotificationModel.fromJson(response.data);
        if (notificationModel.status == 200) {
          List<NotificationData> todayNotifications = [];
          List<NotificationData> yesterdayNotifications = [];
          List<NotificationData> olderNotifications = [];

          final now = DateTime.now();
          final todayStart = DateTime(now.year, now.month, now.day);
          final yesterdayStart = todayStart.subtract(Duration(days: 1));
          final yesterdayEnd = todayStart;

          for (var notification in notificationModel.notificationList) {
            final createdAt = notification.createdAt;
            if (createdAt.isAfter(todayStart)) {
              todayNotifications.add(notification);
            } else if (createdAt.isAfter(yesterdayStart) && createdAt.isBefore(yesterdayEnd)) {
              yesterdayNotifications.add(notification);
            } else {
              olderNotifications.add(notification);
            }
          }

          state = state.copyWith(
            isLoading: false,
            notificationList: notificationModel.notificationList,
            todayNotifications: todayNotifications,
            yesterdayNotifications: yesterdayNotifications,
            olderNotifications: olderNotifications,
          );

        } else {
          showToastMessage(notificationModel.message.toString());
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }


}
