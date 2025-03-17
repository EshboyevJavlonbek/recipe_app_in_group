import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_title.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_rating.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_time.dart';

class YourRecipeItem extends StatelessWidget {
  const YourRecipeItem({
    super.key,
    required this.image,
    required this.title,
    required this.rating, required this.timeRequired,
  });

  final String image, title;
  final num rating;
  final int timeRequired;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168.52.w,
      height: 195.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              image,
              width: 168.52.w,
              height: 162.h,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              width: 168.52.w,
              height: 48.3.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withValues(alpha: 0.4),
                    offset: Offset(0.w, 4.h),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipeDetailTitle(
                    title: title,
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecipeRating(rating: rating),
                      RecipeTime(timeRequired: timeRequired),
                    ],
                  ),
                ],
              ),
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
              containerColor: AppColors.redPinkMain,
              iconColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
