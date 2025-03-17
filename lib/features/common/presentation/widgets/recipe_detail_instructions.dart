import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_instructions_item.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_title.dart';

import '../../../recipe_detail/manager/recipe_detail_view_model.dart';

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
        RecipeDetailInstructionsItem(text: vm.recipe.instructions[0].text, number: 1, color: AppColors.pinkSub),
        RecipeDetailInstructionsItem(text: vm.recipe.instructions[0].text, number: 2, color: AppColors.pink),
        RecipeDetailInstructionsItem(text: vm.recipe.instructions[0].text, number: 3, color: AppColors.pinkSub),
        RecipeDetailInstructionsItem(text: vm.recipe.instructions[0].text, number: 4, color: AppColors.pink),
        RecipeDetailInstructionsItem(text: vm.recipe.instructions[0].text, number: 5, color: AppColors.pinkSub),
        RecipeDetailInstructionsItem(text: vm.recipe.instructions[0].text, number: 6, color: AppColors.pink),
      ],
    );
  }
}
