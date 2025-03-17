import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_title.dart';

import '../../../../core/utils/colors.dart';
import '../../../recipe_detail/manager/recipe_detail_view_model.dart';

class RecipeDetailIngredients extends StatelessWidget {
  const RecipeDetailIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.read<RecipeDetailViewModel>();
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecipeDetailTitle(title: "Ingredients"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: List.generate(
              vm.recipe.ingredients.length,
                  (index) {
                return Row(
                  spacing: 5,
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.redPinkMain,
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                    Text(
                      vm.recipe.ingredients[index].amount.toString(),
                      style: TextStyle(
                        color: AppColors.redPinkMain,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      vm.recipe.ingredients[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
