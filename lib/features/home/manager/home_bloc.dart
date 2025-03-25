
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/home/manager/home_events.dart';

import '../../../data/model/category_model.dart';
import '../../../data/model/recipe/recipe_model.dart';
import '../../../data/model/chef/top_chef_model_small.dart';
import '../../../data/repository/category_repository.dart';
import '../../../data/repository/chef_repository.dart';
import '../../../data/repository/recipe_repository.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required CategoryRepository catRepo,
    required RecipeRepository recipeRepo,
    required ChefRepository chefRepo,
  })  : _catRepo = catRepo,
        _recipeRepo = recipeRepo,
        _chefRepo = chefRepo,
        super(
        HomeState(
          status: HomeStatus.loading,
          categories: [],
          yourRecipes: [],
          trendingRecipe: null,
          topChefs: [],
          recentlyAddedRecipes: [],
        ),
      ) {
    on<HomeLoad>(_onLoad);
    add(HomeLoad());
  }

  final CategoryRepository _catRepo;
  final RecipeRepository _recipeRepo;
  final ChefRepository _chefRepo;

  Future _onLoad(HomeLoad event, Emitter<HomeState> emit) async {
    emit(
      HomeState(
        status: HomeStatus.loading,
        categories: [],
        yourRecipes: [],
        trendingRecipe: null,
        topChefs: [],
        recentlyAddedRecipes: [],
      ),
    );
    emit(
      HomeState(
        status: HomeStatus.idle,
        categories: await _catRepo.fetchCategories(),
        yourRecipes: await _recipeRepo.fetchYourRecipes(limit: 2),
        trendingRecipe: await _recipeRepo.fetchTrendingRecipe(),
        topChefs: await _chefRepo.fetchTopChefsForHome(limit: 4),
        recentlyAddedRecipes: await _recipeRepo.fetchRecentlyAddedRecipes(limit: 2),
      ),
    );
  }
}
