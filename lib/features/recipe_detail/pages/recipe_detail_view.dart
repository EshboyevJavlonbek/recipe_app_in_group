import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_details.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_image_and_video.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_ingredients.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_instructions.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_profile.dart';

import '../manager/recipe_detail_view_model.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
          title: vm.recipe.title,
          actions: [
            RecipeIconButtonContainer(
              image: "assets/icons/heart.svg",
              iconWidth: 16,
              iconHeight: 15,
              callback: () {},
            ),
            SizedBox(width: 5),
            RecipeIconButtonContainer(
              image: "assets/icons/share.svg",
              iconWidth: 12,
              iconHeight: 18,
              callback: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 36, right: 36),
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    RecipeDetailImageAndVideo(),
                    SizedBox(height: 15),
                    RecipeDetailProfile(),
                    Divider(color: AppColors.redPinkMain),
                    RecipeDetailDetails(),
                    SizedBox(height: 15),
                    RecipeDetailIngredients(),
                    SizedBox(height: 15),
                    RecipeDetailInstructions(),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      );
    }
  }
}
