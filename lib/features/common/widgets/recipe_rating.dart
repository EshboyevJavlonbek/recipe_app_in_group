import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/data/model/recipe/recipe_model.dart';

class RecipeRating extends StatelessWidget {
  const RecipeRating({
    super.key,
    required this.rating,
    this.textColor = AppColors.pinkSub,
    this.iconColor = AppColors.pinkSub,
    this.swap = false,
  });

  final Color textColor, iconColor;
  final bool swap;



  final num rating;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      rating.toString(),
      style: TextStyle(
        color: textColor,
        fontSize: 12,
      ),
    );

    final icon = SvgPicture.asset(
      "assets/icons/star.svg",
      width: 10.w,
      height: 10.h,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
    return Row(
      spacing: 5.w,
      children: [
        swap ? icon : text,
        swap ? text : icon,
      ],
    );
  }
}
