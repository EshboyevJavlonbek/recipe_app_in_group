import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/data/model/top_chef_model.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/common/widgets/recipe_eleveted_button.dart';
import 'package:recipe/features/common/widgets/recipe_rating.dart';

class TopChefsItem extends StatelessWidget {
  const TopChefsItem({
    super.key,
    required this.chef,
  });

  final TopChefModel chef;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.w,
      height: 217.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 5.h, top: 15.h),
              width: 160.w,
              height: 76.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
                border: Border.all(
                  color: AppColors.pinkSub,
                  width: 1.w,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 140.w,
                    height: 16.h,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "${chef.firstName} ${chef.lastName}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140.w,
                    child: Text(
                      "@${chef.username}",
                      style: TextStyle(
                        color: AppColors.redPinkMain,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Row(
                    spacing: 10.w,
                    children: [
                      RecipeRating(rating: 0),
                      SizedBox(width: 20.w),
                      RecipeElevatedButton(
                        text: "Following",
                        callback: () {},
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.redPinkMain,
                        size: Size(44.w, 14.h),
                      ),
                      RecipeIconButtonContainer(
                        image: "assets/icons/share.svg",
                        callback: (){},
                        containerWidth: 14.w,
                        containerColor: AppColors.redPinkMain,
                        iconColor: Colors.white,
                        containerHeight: 14.h,
                        iconWidth: 7.w,
                        iconHeight: 8.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 170.w,
              height: 153.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  imageUrl: chef.image,
                  width: 170.w,
                  height: 153.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
