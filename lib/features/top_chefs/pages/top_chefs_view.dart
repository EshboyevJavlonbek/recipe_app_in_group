import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe/core/routing/routes.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/top_chefs/manager/top_chefs/top_chefs_bloc.dart';
import 'package:recipe/features/top_chefs/manager/top_chefs/top_chefs_state.dart';
import 'package:recipe/features/top_chefs/widgets/most_liked_chefs_section.dart';
import 'package:recipe/features/top_chefs/widgets/most_viewed_chefs_section.dart';
import 'package:recipe/features/top_chefs/widgets/new_chefs_section.dart';

class TopChefsView extends StatelessWidget {
  const TopChefsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopChefsBloc, TopChefsState>(
      builder: (context, state) => Scaffold(
        appBar: RecipeAppBar(
          title: "Top Chef",
          actions: [
            RecipeIconButtonContainer(
              image: "assets/icons/notification.svg",
              callback: () => context.push(Routes.notifications),
              iconWidth: 12.w,
              iconHeight: 18.h,
            ),
            SizedBox(width: 5.w),
            RecipeIconButtonContainer(
              image: "assets/icons/search.svg",
              callback: () {},
              iconWidth: 12.w,
              iconHeight: 18.h,
            ),
          ],
        ),
        extendBody: true,
        body: Column(
          spacing: 10.h,
          children: [
            MostViewedChefsSection(mostViewed: state.mostViewedChefs),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(bottom: 1.h),
                shrinkWrap: true,
                children: [
                  MostLikedChefsSection(mostLiked: state.mostLikedChefs),
                  SizedBox(height: 10.h),
                  NewChefsSection(newChefs: state.newChefs),
                  SizedBox(height: 120.h),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
