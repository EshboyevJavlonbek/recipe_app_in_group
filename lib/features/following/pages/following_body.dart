import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/following/widgets/following_item.dart';

class FollowingBody extends StatelessWidget {
  const FollowingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        children: [
          SizedBox(
            width: 355.w,
            height: 34.h,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: AppColors.redPinkMain,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                ),
                filled: true,
                fillColor: AppColors.pink,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.only(top: 8.h, left: 12.w, right: 12.w),
              ),
            ),
          ),
          FollowingItem(),
<<<<<<< HEAD

=======
>>>>>>> 14fc21e5c7436c2508f784cd1a38f6c4d583b3fd
        ],
      ),
    );
  }
}
