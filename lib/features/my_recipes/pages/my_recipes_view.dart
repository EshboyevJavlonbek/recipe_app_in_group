import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe/core/routing/routes.dart';
import 'package:recipe/features/category_detail/widgets/recipe_item/recipe_item.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/home/widgets/your_recipes_section.dart';
import 'package:recipe/features/my_recipes/manager/my_recipes_bloc.dart';
import 'package:recipe/features/my_recipes/manager/my_recipes_state.dart';

class MyRecipesView extends StatelessWidget {
  const MyRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRecipesBloc, MyRecipesState>(
      builder: (context, state) => Scaffold(
        appBar: RecipeAppBar(
          title: "Your Recipes",
          actions: [
            RecipeIconButtonContainer(
              image: "assets/icons/notification.svg",
              callback: () => context.push(Routes.notifications),
              iconWidth: 12.w,
              iconHeight: 17.h,
            ),
            SizedBox(width: 5.w),
            RecipeIconButtonContainer(
              image: "assets/icons/search.svg",
              callback: () {},
              iconWidth: 12.w,
              iconHeight: 17.h,
            ),
          ],
        ),
        extendBody: true,
        body: Column(
          children: [
            YourRecipesSection(
              title: "Most Viewed Today",
              recipes: state.mostViewed,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                ),
                itemCount: state.recipes.length,
                itemBuilder: (BuildContext context, int index) => RecipeItem(
                  recipe: state.recipes[index],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
