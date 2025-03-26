import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe/core/routing/routes.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/home/widgets/your_recipes_section.dart';

class MyRecipesView extends StatelessWidget {
  const MyRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(
        title: "Your Recipes",
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () => context.push(Routes.notifications),
            iconWidth: 12.w,
            iconHeight: 17.h,
          ),
          SizedBox(width: 5.w),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            callback: () {},
            iconWidth: 12.w,
            iconHeight: 17.h,
          ),
        ],
      ),
      extendBody: true,
      body: Column(
        children: [
          YourRecipesSection(
            title: "Most Viewed Today",
            recipes: [],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 1),
              children: [
                Image.asset("assets/images/breakfast.png"),
                Image.asset("assets/images/breakfast.png"),
                SizedBox(height: 120.h),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
