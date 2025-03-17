import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_rating.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_time.dart';

class TrendingRecipeContainer extends StatelessWidget {
  const TrendingRecipeContainer({
    super.key,
    required this.title,
    required this.desc,
    required this.timeRequired,
    required this.rating,
  });

  final String title, desc;
  final int timeRequired;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(
          top: 12.h,
          right: 15.w,
          left: 15.w,
        ),
        width: 348.w,
        height: 58.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
              14,
            ),
          ),
          border: Border.all(
            color: AppColors.pinkSub,
            width: 1.w,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),
                RecipeTime(timeRequired: timeRequired),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 240,
                  child: Text(
                    desc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      fontFamily: "League Spartan",
                    ),
                  ),
                ),
                RecipeRating(rating: rating),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
