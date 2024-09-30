import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/shared/providers.dart';
import '../application/notification_notifier.dart';
import '../application/notification_state.dart';


final notificationNotifierProvider =
    StateNotifierProvider.autoDispose<NotificationNotifier, NotificationState>(
        (ref) => NotificationNotifier(
            ref.watch(networkService)
        )
    );
