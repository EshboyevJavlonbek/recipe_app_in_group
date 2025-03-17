import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/reviews/manager/reviews_bloc.dart';
import 'package:recipe/features/reviews/manager/reviews_state.dart';
import 'package:recipe/features/reviews/widgets/recipe_reviews_item_info.dart';

class RecipeReviewsItem extends StatelessWidget {
  const RecipeReviewsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, state) {
        return switch (state.status) {
          ReviewsStatus.error => Center(child: Text("Xatolik!")),
          ReviewsStatus.loading => Center(child: CircularProgressIndicator()),
          ReviewsStatus.idle => Container(
              padding: EdgeInsets.symmetric(
                horizontal: 36,
                vertical: 30,
              ),
              width: double.infinity.w,
              height: 223.h,
              decoration: BoxDecoration(
                color: AppColors.redPinkMain,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                spacing: 10,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      state.recipeModel!.image,
                      width: 162.w,
                      height: 163.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  RecipeReviewsItemInfo(
                    title: state.recipeModel!.title,
                    userPhoto: state.recipeModel!.user.image,
                    username: state.recipeModel!.user.username,
                    firstName: state.recipeModel!.user.firstName,
                    lastName: state.recipeModel!.user.lastName,
                    reviews: state.recipeModel!.reviewsCount,
                  ),
                ],
              ),
            ),
        };
      },
    );
  }
}
