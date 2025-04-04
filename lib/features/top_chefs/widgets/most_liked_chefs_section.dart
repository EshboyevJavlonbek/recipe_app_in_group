import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/top_chefs/widgets/top_chefs_item.dart';
import '../../../data/model/chef/top_chef_model.dart';

class MostLikedChefsSection extends StatelessWidget {
  const MostLikedChefsSection({
    super.key,
    required this.mostLiked,
  });

  final List<TopChefModel> mostLiked;

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
              mostLiked.length,
                  (index) => TopChefsItem(
                chef: mostLiked[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
