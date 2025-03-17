import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/data/model/recipe_model.dart';
import 'package:recipe/features/category_detail/widgets/recipe_item/recipe_item_image.dart';
import 'package:recipe/features/category_detail/widgets/recipe_item/recipe_item_info.dart';
import 'package:recipe/features/common/common.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 169.w,
        height: 226.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            RecipeItemInfo(recipe: recipe),
            RecipeItemImage(recipe: recipe),
            Positioned(
              top: 7,
              right: 8,
              child: RecipeIconButtonContainer(
                image: "assets/icons/heart.svg",
                callback: () {},
                iconWidth: 16.w,
                iconHeight: 15.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
