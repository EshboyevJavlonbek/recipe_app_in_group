import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/following/manager/following_bloc.dart';
import 'package:recipe/features/following/manager/following_state.dart';
import 'package:recipe/features/following/widgets/following_body.dart';
import 'package:recipe/features/following/widgets/follower_body.dart';

class FollowingView extends StatelessWidget {
  const FollowingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowingBloc, FollowingState>(
      builder: (context, state) => switch (state.status) {
        FollowingStatus.loading => Center(child: CircularProgressIndicator()),
        FollowingStatus.error => Center(child: Text('Xatolik boldi')),
        FollowingStatus.idle => DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: RecipeAppBar(
                centerTitle: false,
                title: "@dianne_r",
                bottom: TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  dividerColor: Colors.transparent,
                  labelColor: AppColors.redPinkMain,
                  unselectedLabelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.redPinkMain,
                    ),
                  ),
                  tabs: [
                    Tab(text: "Following"),
                    Tab(text: "Followers"),
                  ],
                ),
                actions: [],
              ),
              extendBody: true,
              body: TabBarView(
                children: [
                  FollowingBody(model: state.following!),
                  FollowerBody(model: state.follower!),
                ],
              ),
            ),
          ),
      },
    );
  }
}
