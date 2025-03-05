import 'package:flutter/material.dart';
import 'package:recipe/core/utils/colors.dart';

class RecipeDetailInstructionsItem extends StatelessWidget {
  const RecipeDetailInstructionsItem({
    super.key,
    required this.text,
    required this.number,
    required this.color,
  });

  final Color color;
  final String text;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 30),
      width: 356,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(
            "$number.",
            style: TextStyle(
              color: AppColors.beigeColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(
            width: 250,
            height: 54,
            child: Text(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              text,
              style: TextStyle(
                color: AppColors.beigeColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
