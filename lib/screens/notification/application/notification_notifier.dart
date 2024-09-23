// ignore_for_file: parameter_assignments, empty_catches
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/utils/toast.dart';
import '../../../model/notification_model/notification_model.dart';
import 'notification_state.dart';

class NotificationNotifier extends StateNotifier<NotificationState> {
  NotificationNotifier(this._networkApiService) : super(const NotificationState());

  final NetworkApiService _networkApiService;
  final RefreshController refreshController = RefreshController();

  void addNotification(NotificationData notification) {
    if (mounted) {
      state = state.copyWith(
        todayNotifications: [...state.todayNotifications, notification],
      );
    }
  }

  void loadMoreNotifications() async {
    if (state.currentPage > state.totalPages) {
      showToastMessage('No new notification to display');
      refreshController.loadComplete();
      return;
    }

    await getNotificationList(isLoadMore: true);
    refreshController.loadComplete();
  }



  Future<void> getNotificationList({bool isLoadMore = false}) async {
    state = state.copyWith(isLoading: !isLoadMore);
    if (isLoadMore && (state.currentPage * 10 == state.notificationList.length)) {
      state = state.copyWith(currentPage: state.currentPage + 1);
    } else {
      state = state.copyWith(currentPage: 1);
    }
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.baseUrl}${AppUrls.getAllNotifications}',
        body: {
          "limit": 10,
          "page": isLoadMore ? state.currentPage + 1 : 1,
        }
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
          final yesterdayStart = todayStart.subtract(const Duration(days: 1));
          final yesterdayEnd = todayStart;

          for (var notification in notificationModel.notificationList) {
            final createdAt = notification.createdAt;
            if (createdAt!.isAfter(todayStart)) {
              todayNotifications.add(notification);
            } else if (createdAt.isAfter(yesterdayStart) && createdAt.isBefore(yesterdayEnd)) {
              yesterdayNotifications.add(notification);
            } else {
              olderNotifications.add(notification);
            }
          }

          if (isLoadMore) {
            state = state.copyWith(
              isLoading: false,
              notificationList: [
                ...state.notificationList,
                ...notificationModel.notificationList,
              ],
              todayNotifications: [
                ...state.todayNotifications,
                ...todayNotifications,
              ],
              yesterdayNotifications: [
                ...state.yesterdayNotifications,
                ...yesterdayNotifications,
              ],
              olderNotifications: [
                ...state.olderNotifications,
                ...olderNotifications,
              ],
              totalNotifications: notificationModel.total ?? state.totalNotifications,
              totalPages: notificationModel.pages ?? state.totalPages,
            );
          } else {
            state = state.copyWith(
              isLoading: false,
              notificationList: notificationModel.notificationList,
              todayNotifications: todayNotifications,
              yesterdayNotifications: yesterdayNotifications,
              olderNotifications: olderNotifications,
              totalNotifications: notificationModel.total ?? 10,
              totalPages: notificationModel.pages ?? 1,
            );
          }
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
