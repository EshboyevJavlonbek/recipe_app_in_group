import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/top_chefs/manager/top_chefs_bloc.dart';
import 'package:recipe/features/top_chefs/manager/top_chefs_state.dart';
import 'package:recipe/features/top_chefs/pages/new_chefs_section.dart';
import 'package:recipe/features/top_chefs/pages/top_chefs_item.dart';

import '../../../data/model/top_chef_model.dart';

class MostViewedChefsSection extends StatelessWidget {
  const MostViewedChefsSection({
    super.key,
    required this.mostViewed,
  });

  final List<TopChefModel> mostViewed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 36.w,
        right: 36.w,
        top: 9.h,
        bottom: 18.h,
      ),
      width: 430.w,
      height: 285.h,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Most Viewed Chefs",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              mostViewed.length,
              (index) => TopChefsItem(
                chef: mostViewed[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
