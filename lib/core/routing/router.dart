import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/routing/routes.dart';
import 'package:recipe/features/categories/data/models/category_model.dart';
import 'package:recipe/features/categories/presentation/pages/categories_view.dart';
import 'package:recipe/features/category_detail/data/repositories/recipe_repository.dart';
import 'package:recipe/features/category_detail/presentation/manager/category_detail_view_model.dart';
import 'package:recipe/features/community/data/repositories/community_repository.dart';
import 'package:recipe/features/community/presentation/manager/community_view_model.dart';
import 'package:recipe/features/community/presentation/pages/community_view.dart';
import 'package:recipe/features/home/data/repository/top_chef_repository.dart';
import 'package:recipe/features/home/presentation/manager/home_view_model.dart';
import 'package:recipe/features/recipe_detail/presentation/manager/recipe_detail_view_model.dart';
import 'package:recipe/features/recipe_detail/presentation/pages/recipe_detail_view.dart';

import '../../features/categories/presentation/managers/categories_cubit.dart';
import '../../features/category_detail/presentation/pages/category_detail_view.dart';
import '../../features/home/presentation/pages/home_view.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => BlocProvider(
        create: (context) => CategoriesCubit(
          catRepo: context.read(),
        ),
        child: CategoriesView(),
      ),
    ),
    GoRoute(
      path: Routes.categoryDetail,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CategoryDetailViewModel(
          catRepo: context.read(),
          recipeRepo: context.read(),
          selected: state.extra as CategoryModel,
        )..load(),
        child: CategoryDetailView(),
      ),
    ),
    GoRoute(
      path: Routes.recipeDetail,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => RecipeDetailViewModel(
          recipeRepo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!),
        ),
        child: RecipeDetailView(),
      ),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => HomeViewModel(
            recipeRepo: RecipeRepository(client: context.read()),
            chefRepo: TopChefRepository(
              client: context.read(),
            )),
        child: HomeView(),
      ),
    ),
    GoRoute(
      path: Routes.community,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CommunityViewModel(
          repo: CommunityRepository(
            client: context.read(),
          ),
        ),
        child: CommunityView(),
      ),
    ),
  ],
);
