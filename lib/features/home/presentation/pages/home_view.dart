import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/home/presentation/pages/home_app_bar.dart';
import 'package:recipe/features/home/presentation/pages/recipe_recently_added.dart';
import 'package:recipe/features/home/presentation/pages/top_chef.dart';
import 'package:recipe/features/home/presentation/pages/trending_recipe.dart';
import 'package:recipe/features/home/presentation/pages/your_recipes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        name: "Dianne",
        bottom: PreferredSize(
          preferredSize: Size(double.infinity.w, 30.h),
          child: Row(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        children: [
          TrendingRecipe(
            image: "assets/images/breakfast.png",
            title: "Salami and cheese pizza",
            desc: "This is a quick overview of ingredients",
            timeRequired: 30,
            rating: 5,
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
    );
  }
}
