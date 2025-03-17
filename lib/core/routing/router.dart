import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/routing/routes.dart';
import 'package:recipe/data/repository/recipe_repository.dart';
import 'package:recipe/data/model/top_chef_repository.dart';
import 'package:recipe/data/repository/reviews_repository.dart';

import '../../features/categories/managers/categories_cubit.dart';
import '../../features/categories/pages/categories_view.dart';
import '../../features/community/manager/community_view_model.dart';
import '../../features/community/pages/community_view.dart';
import '../../features/home/manager/home_view_model.dart';
import '../../features/home/pages/home_view.dart';
import '../../features/recipe_detail/manager/recipe_detail_view_model.dart';
import '../../features/recipe_detail/pages/recipe_detail_view.dart';
import '../../features/reviews/manager/reviews_bloc.dart';
import '../../features/reviews/pages/reviews_view.dart';

final router = GoRouter(
  initialLocation: Routes.reviews,
  routes: [
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => BlocProvider(
        create: (context) => CategoriesBloc(
          catRepo: context.read(),
        ),
        child: CategoriesView(),
      ),
    ),
    // GoRoute(
    //   path: Routes.categoryDetail,
    //   builder: (context, state) => BlocProvider(create: (context)=> CategoryDetailBloc(catRepo: context. read(), recipeRepo: recipeRepo, selectedId: selectedId) ),
    // ),

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
          ),
        ),
        child: HomeView(),
      ),
    ),

    GoRoute(
      path: Routes.community,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CommunityViewModel(
          repo: RecipeRepository(
            client: context.read(),
          ),
        ),
        child: CommunityView(),
      ),
    ),

    GoRoute(
      path: Routes.reviews,
      builder: (context, state) => BlocProvider(
        create: (context) => ReviewsBloc(
          recipeRepo: context.read(),
          recipeId: 2,
          reviewsRepo: ReviewsRepository(
            client: context.read(),
          ),
        ),
        child: ReviewsView(),
      ),
    ),
  ],
);
