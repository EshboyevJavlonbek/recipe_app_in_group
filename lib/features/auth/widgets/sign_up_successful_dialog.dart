import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';

class SuccessfulSignUpDialog extends StatelessWidget {
  const SuccessfulSignUpDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Colors.white,
        child: Container(
          width: 250.w,
          height: 286.h,
          padding: EdgeInsets.symmetric(
            horizontal: 36.w,
            vertical: 24.h,
          ),
          child: Column(
            spacing: 9.h,
            children: [
              SizedBox(
                width: 133.w,
                height: 44.h,
                child: Text(
                  "Sign Up Successful!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.beigeColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ),
              Container(
                width: 82.w,
                height: 82.h,
                decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(41),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    width: 30.w,
                    height: 45.h,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      AppColors.redPinkMain,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Text(
                "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.beigeColor,
                  fontSize: 13.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}