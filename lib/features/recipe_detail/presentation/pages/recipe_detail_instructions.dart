import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/recipe_detail/presentation/manager/recipe_detail_view_model.dart';
import 'package:recipe/features/recipe_detail/presentation/pages/recipe_detail_instructions_item.dart';
import 'package:recipe/features/recipe_detail/presentation/pages/recipe_detail_title.dart';

class RecipeDetailInstructions extends StatelessWidget {
  const RecipeDetailInstructions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var vm = context.read<RecipeDetailViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        RecipeDetailTitle(title: "6 Easy Steps"),
        RecipeDetailInstructionsItem(vm: vm, number: 1, index: 0, color: AppColors.pinkSub,),
        RecipeDetailInstructionsItem(vm: vm, number: 2, index: 1, color: AppColors.pink),
        RecipeDetailInstructionsItem(vm: vm, number: 3, index: 2, color: AppColors.pinkSub,),
        RecipeDetailInstructionsItem(vm: vm, number: 4, index: 3, color: AppColors.pink),
        RecipeDetailInstructionsItem(vm: vm, number: 5, index: 4, color: AppColors.pinkSub,),
        RecipeDetailInstructionsItem(vm: vm, number: 6, index: 5, color: AppColors.pink),
      ],
    );
  }
}
