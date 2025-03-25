
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/repository/notifications_repository.dart';

import 'notificatons_state.dart';
part 'notifications_events.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsRepository _repo;

  NotificationsBloc({required NotificationsRepository repo,})
      : _repo = repo,
        super(NotificationsState.initial()) {
    on<NotificationsLoading>(_onLoad);
    add(NotificationsLoading());
  }

  Future<void> _onLoad(NotificationsLoading event, Emitter<NotificationsState> emit) async {
    emit(state.copyWith(status: NotificationsStatus.loading));
    final notification = await _repo.fetchNotification();
    emit(state.copyWith(notifications: notification, status: NotificationsStatus.success));
  }
}
