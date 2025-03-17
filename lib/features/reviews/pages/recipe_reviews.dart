import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_title.dart';

import '../../common/presentation/widgets/recipe_app_bar.dart';
import '../../common/presentation/widgets/recipe_bottom_navigation_bar.dart';
import '../manager/reviews_bloc.dart';
import '../manager/reviews_state.dart';

class RecipeReviews extends StatelessWidget {
  const RecipeReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, state) {
        if (state.reviews.isEmpty) {
          return Scaffold(
            appBar: RecipeAppBar(title: "Reviews", actions: null),
            body: Center(
              child: Text("No reviews available."),
            ),
            bottomNavigationBar: RecipeBottomNavigationBar(),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: Column(
            spacing: 15.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeDetailTitle(
                title: "Comments",
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10.w,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          state.reviews[0].image,
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "@${state.reviews[0].user.username}",
                        style: TextStyle(
                          color: AppColors.redPinkMain,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    state.reviews[0].comment,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Row(
                    spacing: 10.w,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        width: 15.w,
                        height: 15.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.redPinkMain,
                          BlendMode.srcIn,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        width: 15.w,
                        height: 15.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.redPinkMain,
                          BlendMode.srcIn,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        width: 15.w,
                        height: 15.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.redPinkMain,
                          BlendMode.srcIn,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        width: 15.w,
                        height: 15.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.redPinkMain,
                          BlendMode.srcIn,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        width: 15.w,
                        height: 15.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.redPinkMain,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: AppColors.redPinkMain),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
