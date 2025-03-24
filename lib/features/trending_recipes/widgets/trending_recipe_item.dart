import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/features/common/widgets/recipe_rating.dart';
import 'package:recipe/features/common/widgets/recipe_time.dart';
import 'package:recipe/features/trending_recipes/widgets/recipe_level.dart';

import '../../../core/utils/colors.dart';

class TrendingRecipeItem extends StatelessWidget {
  const TrendingRecipeItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.name,
    required this.level,
    required this.timeRequired,
    required this.rating,
  });

  final String image, title, description, name, level;

  final int timeRequired;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 358.w,
        height: 150.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 9.h,
                ),
                width: 207.w,
                height: 122.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(15),
                  ),
                ),
                child: Column(
                  spacing: 4.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 186.w,
                      height: 18.h,
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        title,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 186.w,
                      height: 37.h,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        description,
                        style: TextStyle(
                          fontFamily: "League Spartan",
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 186.w,
                      height: 15.h,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        "By Chef $name",
                        style: TextStyle(
                          color: AppColors.redPinkMain,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 186.w,
                      height: 22.h,
                      child: Row(
                        spacing: 25.w,
                        children: [
                          RecipeTime(
                            timeRequired: timeRequired,
                            color: AppColors.redPinkMain,
                            iconColor: AppColors.redPinkMain,
                          ),
                          RecipeLevel(
                            level: level,
                          ),
                          RecipeRating(rating: rating),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                image,
                width: 151.w,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
