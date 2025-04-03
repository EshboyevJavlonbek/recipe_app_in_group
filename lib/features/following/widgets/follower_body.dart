import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/data/model/recipe/user_model_in_recipe.dart';
import 'package:recipe/features/following/widgets/follower_item.dart';

class FollowerBody extends StatelessWidget {
  const FollowerBody({
    super.key,
    required this.model,
  });

  final List<UserModelInRecipe> model;

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
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: model.length,
              itemBuilder: (context, index) => FollowerItem(
                image: model[index].image,
                username: model[index].username,
                firstName: model[index].firstName,
                lastName: model[index].lastName,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
