import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_title.dart';
import 'package:recipe/features/home/presentation/pages/your_recipe_item.dart';

class RecipeRecentlyAdded extends StatelessWidget {
  const RecipeRecentlyAdded({
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
            title: "Recently Added",
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              YourRecipeItem(
                image: "assets/images/cookies.png",
                title: "Cookies",
                rating: 5,
                timeRequired: 30,
              ),
              YourRecipeItem(
                image: "assets/images/cookies.png",
                title: "Cookies",
                rating: 5,
                timeRequired: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
