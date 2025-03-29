import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/common/widgets/recipe_eleveted_button.dart';
class FollowingView extends StatelessWidget {
  const FollowingView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: RecipeAppBar(
          title: "@dianne_r",
          bottom: TabBar(
            dividerColor: Colors.transparent,
            labelColor: AppColors.redPinkMain,
            unselectedLabelColor: Colors.white,
            labelStyle: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 1, color: AppColors.pink),
              insets: EdgeInsets.symmetric(horizontal: 135),
            ),
            tabs: const [
              Tab(text: "120 Following"),
              Tab(text: "250 Followers"),
            ],
          ),
          actions: [],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: "Search",
                  hintStyle: TextStyle(color: AppColors.redPinkMain),
                  filled: true,
                  fillColor: AppColors.pink,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36, right: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(33),
                    child: Image.asset(
                      "assets/images/breakfast.png",
                      width: 61,
                      height: 63,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    spacing: 4,
                    children: [
                      Text(
                        "@sweet.sarah",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.redPinkMain,
                        ),
                      ),
                      Text(
                        "Sarah Johnson",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Following",
                    style: TextStyle(
                      fontFamily: "League Spartan",
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.redPinkMain,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RecipeElevatedButton(
                    size: Size(70.w, 21.h),
                    text: "Delete",
                    callback: (){},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
