import 'package:flutter/material.dart';
import 'package:recipe/core/utils/colors.dart';

class RecipeDetailTitle extends StatelessWidget {
  const RecipeDetailTitle({
    super.key,
    required this.title,
    this.color = AppColors.redPinkMain,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w600,
    this.fontFamily = "Poppins",
  });
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
