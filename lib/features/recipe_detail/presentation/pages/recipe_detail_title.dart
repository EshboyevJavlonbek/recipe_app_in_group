import 'package:flutter/material.dart';
import 'package:recipe/core/utils/colors.dart';

class RecipeDetailTitle extends StatelessWidget {
  const RecipeDetailTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.redPinkMain,
        fontSize: 20,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
