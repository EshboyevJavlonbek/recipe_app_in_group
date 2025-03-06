import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_title.dart';
import 'package:recipe/features/home/presentation/manager/home_view_model.dart';
import 'package:recipe/features/home/presentation/pages/your_recipe_item.dart';

class YourRecipes extends StatelessWidget {
  const YourRecipes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<HomeViewModel>();
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 38.w,
        ),
        width: double.infinity.w,
        height: 255.h,
        decoration: BoxDecoration(
          color: AppColors.redPinkMain,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          spacing: 5.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeDetailTitle(
              title: "Your Recipes",
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                YourRecipeItem(
                  image: vm.recipes[0].photo,
                  title: vm.recipes[0].title,
                  rating: vm.recipes[0].rating,
                  timeRequired: vm.recipes[0].timeRequired,
                ),
                YourRecipeItem(
                  image: vm.recipes[1].photo,
                  title: vm.recipes[1].title,
                  rating: vm.recipes[1].rating,
                  timeRequired: vm.recipes[1].timeRequired,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
