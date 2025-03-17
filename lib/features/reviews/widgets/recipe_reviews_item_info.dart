import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_username_item.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_eleveted_button.dart';

class RecipeReviewsItemInfo extends StatelessWidget {
  const RecipeReviewsItemInfo({
    super.key,
    required this.title,
    required this.userPhoto,
    required this.username,
    required this.reviews,
    required this.firstName,
    required this.lastName,
  });

  final String title, userPhoto, username, firstName, lastName;
  final int reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5.h,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/star.svg",
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 10.w,
              height: 10.h,
            ),
            Text(
              "($reviews Reviews)",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Row(
          spacing: 5.w,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                userPhoto,
                width: 32.w,
                height: 33.h,
                fit: BoxFit.cover,
              ),
            ),
            RecipeDetailUsernameItem(
              username: username,
              firstName: firstName,
              lastName: lastName,
              color: Colors.white,
            ),
          ],
        ),
        RecipeElevatedButton(
          text: "Add Review",
          fontSize: 15.sp,
          callback: () {},
          backgroundColor: Colors.white,
          foregroundColor: AppColors.redPinkMain,
          size: Size(126.w, 24.h),
        ),
      ],
    );
  }
}
