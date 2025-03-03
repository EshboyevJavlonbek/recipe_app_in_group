import 'package:flutter/material.dart';
import 'package:recipe/core/utils/colors.dart';

class RecipeDetailLine extends StatelessWidget {
  const RecipeDetailLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356,
      height: 1,
      decoration: BoxDecoration(
        color: AppColors.pinkSub,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
