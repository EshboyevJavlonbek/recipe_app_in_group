import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe/core/routing/routes.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_reviews.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_time.dart';
import 'package:recipe/features/community/presentation/widgets/recipe_community_rating.dart';

class RecipeCommunityProduct extends StatelessWidget {
  const RecipeCommunityProduct({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.rating,
    required this.timeRequired,
    required this.comments,
    required this.id,
  });

  final String image, title, desc;
  final num rating;
  final int timeRequired, comments, id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(Routes.recipeDetail[id]),
      child: SizedBox(
        width: 356.w,
        height: 250.h,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
              child: CachedNetworkImage(
                imageUrl: image,
                width: 356.w,
                height: 173.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 11.w,
              top: 11.h,
              child: RecipeIconButtonContainer(
                image: "assets/icons/heart.svg",
                callback: () {},
                iconWidth: 16.w,
                iconHeight: 15.h,
                containerColor: AppColors.redPinkMain,
                iconColor: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(top: 4.h, left: 15.w, right: 15.w),
                width: 356.w,
                height: 78.h,
                decoration: BoxDecoration(
                  color: AppColors.redPinkMain,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
                ),
                child: Column(
                  children: [
                    Row(
                      spacing: 15.w,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        RecipeCommunityRating(
                          rating: rating,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 258.31.w,
                          height: 45.h,
                          child: Text(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            desc,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              fontFamily: "League Spartan",
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            RecipeTime(timeRequired: timeRequired),
                            RecipeReviews(reviews: comments),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
