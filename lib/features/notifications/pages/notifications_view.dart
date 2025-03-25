import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/notifications/manager/notifications_bloc.dart';
import 'package:recipe/features/notifications/widgets/notifications_item.dart';

import '../manager/notificatons_state.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) => Scaffold(
        appBar: RecipeAppBar(
          title: "Notifications",
          actions: null,
        ),
        extendBody: true,
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          itemCount: state.notifications!.length,
          itemBuilder: (context, index) => NotificationItem(
            image: 'assets/icons/star.svg',
            title: state.notifications![index].title,
            description: state.notifications![index].subtitle,
            time: state.notifications![index].date.toString(),
          ),
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
