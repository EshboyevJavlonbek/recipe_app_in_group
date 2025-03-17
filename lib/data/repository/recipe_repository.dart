import 'package:recipe/core/client.dart';
import 'package:recipe/data/model/reviews_recipe_model.dart';
import 'package:recipe/data/model/recipe_model.dart';
import 'package:recipe/data/model/recipe_detail_model.dart';

import '../model/community_model.dart';

class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;

  Map<int, List<RecipeModel>> recipesByCategory = {};
  RecipeDetailModel? recipe;

  ReviewsRecipeModel? reviewsModel;
  Future<List<RecipeModel>> fetchRecipesByCategory(int categoryId) async {
    if (recipesByCategory.containsKey(categoryId) && recipesByCategory[categoryId] != null) {
      return recipesByCategory[categoryId]!;
    }

    var rawRecipes = await client.fetchRecipesByCategory(categoryId);
    final recipes = rawRecipes.map((recipe) => RecipeModel.fromJson(recipe)).toList();
    recipesByCategory[categoryId] = recipes;
    return recipes;
  }

  Future<RecipeDetailModel> fetchRecipeById(int recipeId) async {
    final rawRecipe = await client.fetchRecipeById(recipeId);
    recipe = RecipeDetailModel.fromJson(rawRecipe);
    return recipe!;
  }

  Future<RecipeModel> fetchTrendingRecipe() async {
    var rawRecipe = await client.fetchTrendingRecipe();
    return RecipeModel.fromJson(rawRecipe);
  }

  Future<List<RecipeModel>> fetchYourRecipes() async {
    var rawRecipe = await client.fetchYourRecipes();
    return rawRecipe.map((recipe) => RecipeModel.fromJson(recipe)).toList();
  }


  Future<ReviewsRecipeModel> fetchRecipeForReviews(int recipeId) async{
    var rawRecipe = await client.fetchRecipeForReviews(recipeId);
    reviewsModel = ReviewsRecipeModel.fromJson(rawRecipe);
    return reviewsModel!;
  }

  List<CommunityModel> community = [];

  Future<List<CommunityModel>> fetchCommunity(String order) async{
    var rawCommunity = await client.fetchCommunity(order);
    community = rawCommunity.map((recipe) => CommunityModel.fromJson(recipe)).toList();
    return community;
  }
}
