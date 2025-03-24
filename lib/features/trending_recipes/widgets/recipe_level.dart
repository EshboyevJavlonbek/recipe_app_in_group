import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';

class RecipeLevel extends StatelessWidget {
  const RecipeLevel({
    super.key, required this.level,
  });

  final String level;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          level,
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        SvgPicture.asset(
          "assets/icons/level.svg",
          width: 13.w,
          height: 10.h,
        ),
      ],
    );
  }
}
