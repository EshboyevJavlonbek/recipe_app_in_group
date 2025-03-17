import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_detail_title.dart';
import 'package:recipe/features/home/pages/your_recipe_item.dart';

import '../manager/home_view_model.dart';

class RecipeRecentlyAdded extends StatelessWidget {
  const RecipeRecentlyAdded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<HomeViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecipeDetailTitle(
            title: "Recently Added",
            fontSize: 15,
            fontWeight: FontWeight.w500,
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
          )
        ],
      ),
    );
  }
}
