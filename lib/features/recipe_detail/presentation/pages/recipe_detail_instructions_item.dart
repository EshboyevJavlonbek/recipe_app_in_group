import 'package:flutter/material.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/recipe_detail/presentation/manager/recipe_detail_view_model.dart';

class RecipeDetailInstructionsItem extends StatelessWidget {
  const RecipeDetailInstructionsItem({
    super.key,
    required this.vm,
    required this.number,
    required this.index,
    required this.color,
  });
  final Color color;
  final RecipeDetailViewModel vm;
  final int number, index;

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
        spacing: 5,
        children: [
          Text(
            "${number.toString()}.",
            style: TextStyle(
              color: AppColors.beigeColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
          ),
          Text(maxLines: 3,
            overflow: TextOverflow.ellipsis,
            vm.recipe.instructions[index].text,
            style: TextStyle(
              color: AppColors.beigeColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
}
