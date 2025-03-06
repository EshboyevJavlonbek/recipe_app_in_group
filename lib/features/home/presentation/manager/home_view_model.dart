import 'package:flutter/material.dart';
import 'package:recipe/features/category_detail/data/models/recipe_model.dart';
import 'package:recipe/features/category_detail/data/repositories/recipe_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required RecipeRepository recipeRepo}) : _recipeRepo = recipeRepo {
    load();
  }

  final RecipeRepository _recipeRepo;

  bool isLoading = false;
  RecipeModel? recipeModel;

  List<RecipeModel> recipes = [];

  Future<void> load() async{
    isLoading = true;
    notifyListeners();
    recipeModel = await _recipeRepo.fetchTrendingRecipe();
    recipes = await _recipeRepo.fetchYourRecipes();
    isLoading = false;
    notifyListeners();
  }
}
