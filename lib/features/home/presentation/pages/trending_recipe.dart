import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_title.dart';
import 'package:recipe/features/home/presentation/pages/trending_recipe_container.dart';

class TrendingRecipe extends StatelessWidget {
  const TrendingRecipe({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.timeRequired,
    required this.rating,
  });

  final String title, desc;
  final int timeRequired;
  final num rating;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecipeDetailTitle(
            title: "Trending Recipe",
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            width: 358.w,
            height: 190.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                TrendingRecipeContainer(
                  title: title,
                  desc: desc,
                  timeRequired: timeRequired,
                  rating: rating,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    image,
                    width: 358.w,
                    height: 143.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 7.h,
                  right: 8.w,
                  child: RecipeIconButtonContainer(
                    image: "assets/icons/heart.svg",
                    callback: () {},
                    iconWidth: 16.w,
                    iconHeight: 15.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
