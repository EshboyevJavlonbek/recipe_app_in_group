import 'package:equatable/equatable.dart';
import 'package:recipe/data/model/notifications_model.dart';

enum NotificationsStatus { idle, success, loading, error }

class NotificationsState extends Equatable {
  final List<NotificationsModel>? notifications;
  final NotificationsStatus notificationsStatus;

  const NotificationsState({
    required this.notifications,
    required this.notificationsStatus,
  });

  factory NotificationsState.initial() {
    return NotificationsState(
      notifications: [],
      notificationsStatus: NotificationsStatus.loading,
    );
  }

  NotificationsState copyWith({List<NotificationsModel>? notifications, NotificationsStatus? status}) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      notificationsStatus: status ?? notificationsStatus,
    );
  }

  @override
  List<Object?> get props => [notifications,notificationsStatus];
}
