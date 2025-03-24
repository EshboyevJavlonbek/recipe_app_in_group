import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/top_chefs/pages/top_chefs_item.dart';
import '../../../data/model/top_chef_model.dart';

class NewChefsSection extends StatelessWidget {
  const NewChefsSection({
    super.key,
    required this.newChefs,
  });

  final List<TopChefModel> newChefs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Chefs",
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              newChefs.length,
              (index) => TopChefsItem(
                chef: newChefs[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
