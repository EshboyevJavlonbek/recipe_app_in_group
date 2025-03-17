import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe/features/common/common.dart';

import '../manager/community_view_model.dart';
import '../widgets/community_body.dart';
import '../widgets/recipe_tabs.dart';

class CommunityView extends StatelessWidget implements PreferredSizeWidget {
  const CommunityView({super.key});

  @override
  Size get preferredSize => Size(double.infinity, 164.h);

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<CommunityViewModel>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: RecipeAppBar(
          title: "Community",
          actions: [
            RecipeIconButtonContainer(
              image: "assets/icons/notification.svg",
              callback: () {},
              iconWidth: 12.w,
              iconHeight: 17.h,
            ),
            SizedBox(width: 5.w),
            RecipeIconButtonContainer(
              image: "assets/icons/search.svg",
              callback: () {},
              iconWidth: 12.w,
              iconHeight: 18.h,
            ),
          ],
          bottom: TabBar(
            indicator: BoxDecoration(),
            dividerColor: Colors.transparent,
            tabs: [
              RecipeTabs(title: "Top Recipes"),
              RecipeTabs(title: "Newest"),
              RecipeTabs(title: "Oldest"),
            ],
          ),
        ),
        extendBody: true,
        body: TabBarView(
          children: [
            CommunityBodyRating(vm: vm),
            CommunityBodyNewest(vm: vm),
            CommunityBodyOldest(vm: vm),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
