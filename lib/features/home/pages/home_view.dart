import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/home/pages/recipe_recently_added.dart';
import 'package:recipe/features/home/pages/top_chef.dart';
import 'package:recipe/features/home/pages/trending_recipe.dart';
import 'package:recipe/features/home/pages/your_recipes.dart';

import '../manager/home_view_model.dart';
import '../widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<HomeViewModel>();
    return switch (vm.isLoading) {
      true => Center(
          child: CircularProgressIndicator(),
        ),
      false => Scaffold(
          appBar: HomeAppBar(
            name: "Dianne",
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            children: [
              TrendingRecipe(
                image: vm.recipeModel!.photo,
                title: vm.recipeModel!.title,
                desc: vm.recipeModel!.description,
                timeRequired: vm.recipeModel!.timeRequired,
                rating: vm.recipeModel!.rating,
              ),
              SizedBox(height: 20.h),
              YourRecipes(),
              SizedBox(height: 20.h),
              TopChef(),
              SizedBox(height: 20.h),
              RecipeRecentlyAdded(),
              SizedBox(height: 120.h),
            ],
          ),
          extendBody: true,
          bottomNavigationBar: RecipeBottomNavigationBar(),
        ),
    };
  }
}
