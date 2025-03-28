import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/common/widgets/recipe_eleveted_button.dart';
import 'package:recipe/features/common/widgets/recipe_text_button_container.dart';

class FollowerItem extends StatelessWidget {
  const FollowerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(33),
          child: Image.asset(
            "assets/images/breakfast.png",
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
                "@sweet.sarah",
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
                "Sarah Johnson",
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
        Row(
          spacing: 3.w,
          children: [
            RecipeTextButtonContainer(
              text: "Following",
              containerWidth: 52.w,
              containerHeight: 15.h,
              containerPaddingH: 0,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              textColor: AppColors.redPinkMain,
              containerColor: Colors.transparent,
              callback: (){},
            ),
            RecipeElevatedButton(
              size: Size(69.w, 21.h),
              text: "Delete",
              callback: () {},
              backgroundColor: AppColors.pink,
              foregroundColor: AppColors.pinkSub,
            ),
          ],
        ),
      ],
    );
  }
}
