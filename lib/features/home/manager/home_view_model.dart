import 'package:flutter/material.dart';
import 'package:recipe/data/model/recipe_model.dart';
import 'package:recipe/data/repository/recipe_repository.dart';
import 'package:recipe/data/model/top_chef_model.dart';
import 'package:recipe/data/model/top_chef_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required RecipeRepository recipeRepo,
    required TopChefRepository chefRepo,
  }) : _recipeRepo = recipeRepo, _chefRepo = chefRepo{
    load();
  }

  final RecipeRepository _recipeRepo;

  final TopChefRepository _chefRepo;

  List<TopChefModel> chefs =[];

  bool isLoading = false;
  RecipeModel? recipeModel;

  List<RecipeModel> recipes = [];

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    recipeModel = await _recipeRepo.fetchTrendingRecipe();
    recipes = await _recipeRepo.fetchYourRecipes();
    chefs = await _chefRepo.fetchTopChefs();
    isLoading = false;
    notifyListeners();
  }
}
