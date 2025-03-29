import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/routing/routes.dart';
import 'package:recipe/features/auth/manager/login_view_model.dart';
import 'package:recipe/features/auth/manager/sign_up_view_model.dart';
import 'package:recipe/features/auth/pages/login_view.dart';
import 'package:recipe/features/auth/pages/sign_up_view.dart';
import 'package:recipe/features/category_detail/manager/category_detail_view_model.dart';
import 'package:recipe/features/category_detail/pages/category_detail_view.dart';
import 'package:recipe/features/community/manager/community_cubit.dart';
import 'package:recipe/features/community/pages/community_view.dart';
import 'package:recipe/features/home/manager/home_bloc.dart';
import 'package:recipe/features/home/pages/home_view.dart';
import 'package:recipe/features/my_recipes/manager/my_recipes_bloc.dart';
import 'package:recipe/features/my_recipes/pages/my_recipes_view.dart';
import 'package:recipe/features/notifications/manager/notifications_bloc.dart';
import 'package:recipe/features/notifications/pages/notifications_view.dart';
import 'package:recipe/features/recipe_create_agent/pages/recipe_create.dart';
import 'package:recipe/features/recipe_detail/manager/recipe_detail_view_model.dart';
import 'package:recipe/features/recipe_detail/pages/recipe_detail_view.dart';
import 'package:recipe/features/reviews/manager/create_review/create_review_bloc.dart';
import 'package:recipe/features/reviews/manager/reviews/reviews_bloc.dart';
import 'package:recipe/features/reviews/pages/create_review_view.dart';
import 'package:recipe/features/reviews/pages/reviews_view.dart';
import 'package:recipe/features/top_chefs/manager/top_chef_profile/top_chef_profile_bloc.dart';
import 'package:recipe/features/top_chefs/manager/top_chefs/top_chefs_bloc.dart';
import 'package:recipe/features/top_chefs/pages/top_chefs_view.dart';
import 'package:recipe/features/trending_recipes/manager/trending_recipes_bloc.dart';
import 'package:recipe/features/trending_recipes/pages/trending_recipes_view.dart';
import 'package:recipe/main.dart';

import '../../features/categories/managers/categories_cubit.dart';
import '../../features/categories/pages/categories_view.dart';
import '../../features/following/presentation/pages/following_view.dart';
import '../../features/top_chefs/pages/top_chef_profile_view.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => LoginViewModel(
          repo: context.read(),
        ),
        child: LoginView(),
      ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => SignUpViewModel(
          authRepo: context.read(),
        ),
        child: SignUpView(),
      ),
    ),
    GoRoute(
      path: Routes.recipeCreate,
      builder: (context, state) => RecipeCreate(),
    ),
    GoRoute(
      path: Routes.following,
      builder: (context, state) => FollowingView(),
    ),

    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 1),
        child: BlocProvider(
          create: (context) => HomeBloc(
            catRepo: context.read(),
            recipeRepo: context.read(),
            chefRepo: context.read(),
          ),
          child: HomeView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 2, end: 1).animate(animation),
            child: child,
          ),
        ),
      ),
    ),

    GoRoute(
      path: Routes.community,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 1),
        child: BlocProvider(
        create: (context) => CommunityCubit(
          recipeRepo: context.read(),
        ),
        child: CommunityView(),
      ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 2, end: 1).animate(animation),
            child: child,
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.categories,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 1),
        child: BlocProvider(
          create: (context) => CategoriesBloc(
            catRepo: context.read(),
          ),
          child: CategoriesView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 2, end: 1).animate(animation),
            child: child,
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.categoryDetail,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 1),
        child: BlocProvider(
          create: (context) => CategoryDetailBloc(
            catRepo: context.read(),
            recipeRepo: context.read(),
            selectedId: int.parse(state.pathParameters['categoryId']!),
        ),
        child: CategoryDetailView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 2, end: 1).animate(animation),
            child: child,
          ),
        ),
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
      path: Routes.createReview,
      pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: Duration(seconds: 1),
          child: BlocProvider(
        create: (context) => CreateReviewBloc(
          recipeRepo: context.read(),
          reviewRepo: context.read(),
        )..add(
          CreateReviewLoading(recipeId: int.parse(state.pathParameters['recipeId']!)),
        ),
        child: CreateReviewView(),
      ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 2, end: 1).animate(animation),
            child: child,
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.reviews,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 1),
          child: BlocProvider(
        create: (context) => ReviewsBloc(
          recipeRepo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!),
          reviewsRepo: context.read(),
        ),
        child: ReviewsView(),
      ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 2, end: 1).animate(animation),
            child: child,
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.topChefs,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 1),
          child: BlocProvider(
        create: (context) => TopChefsBloc(
          chefRepo: context.read(),
        ),
        child: TopChefsView(),
      ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 2, end: 1).animate(animation),
            child: child,
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.topChefProfile,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 1),
        child: BlocProvider(
        create: (context) => TopChefProfileBloc(
          profileRepo: context.read(),
          chefId: int.parse(state.pathParameters['chefId']!),
        ),
        child: TopChefProfileView(),
      ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 2, end: 1).animate(animation),
            child: child,
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.trendingRecipes,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 1),
        child: BlocProvider(
        create: (context) => TrendingRecipesBloc(
          recipeRepo: context.read(),
        ),
        child: TrendingRecipesView(),
      ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 2, end: 1).animate(animation),
            child: child,
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.notifications,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 1),
        child: BlocProvider(
        create: (context) => NotificationsBloc(
          repo: context.read(),
        ),
        child: NotificationsView(),
      ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 2, end: 1).animate(animation),
            child: child,
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.myRecipes,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 1),
        child: BlocProvider(
        create: (context) => MyRecipesBloc(
          recipeRepo: context.read(),
        ),
        child: MyRecipesView(),
      ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 2, end: 1).animate(animation),
            child: child,
          ),
        ),
      ),
    ),
  ],
);
