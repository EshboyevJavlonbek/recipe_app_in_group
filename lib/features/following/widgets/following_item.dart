import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/common/widgets/recipe_eleveted_button.dart';

class FollowingItem extends StatelessWidget {
  const FollowingItem({
    super.key,
    required this.image,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  final String image, username, firstName, lastName;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(33),
          child: Image.network(
            image,
            width: 61,
            height: 63,
          ),
        ),
        SizedBox(
          width: 130.w,
          height: 43.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.h,
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                username,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.redPinkMain,
                ),
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                "$firstName $lastName",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        RecipeElevatedButton(
          size: Size(109.w, 21.h),
          text: "Following",
          callback: () {},
          backgroundColor: AppColors.pink,
          foregroundColor: AppColors.pinkSub,
        ),
        RecipeIconButton(
          image: "assets/icons/three_dots.svg",
          size: Size(4.w, 15.h),
          callback: () {},
        ),
      ],
    );
  }
}
