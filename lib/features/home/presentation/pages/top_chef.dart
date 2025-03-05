import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_title.dart';
import 'package:recipe/features/home/presentation/pages/top_chef_item.dart';

class TopChef extends StatelessWidget {
  const TopChef({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecipeDetailTitle(
            title: "Top Chef",
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TopChefItem(image: "assets/images/dinner.png", name: "Joseph"),
              TopChefItem(image: "assets/images/dinner.png", name: "Joseph"),
              TopChefItem(image: "assets/images/dinner.png", name: "Joseph"),
              TopChefItem(image: "assets/images/dinner.png", name: "Joseph"),
            ],
          ),
        ],
      ),
    );
  }
}
