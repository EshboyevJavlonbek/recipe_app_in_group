import 'package:recipe/data/model/recipe/ingredient_model.dart';
import 'package:recipe/data/model/recipe/instruction_model.dart';
import 'package:recipe/data/model/recipe/user_model_in_recipe.dart';

class RecipeDetailModel {
  final int id, categoryId;
  final String title, description;
  final String image, videoRecipe;

  final int timeRequired;
  final int reviewsCount;
  final num rating;
  final UserModelInRecipe user;
  final List<IngredientModel> ingredients;
  final List<InstructionModel> instructions;

  RecipeDetailModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.image,
    required this.videoRecipe,
    required this.reviewsCount,
    required this.timeRequired,
    required this.rating,
    required this.user,
    required this.ingredients,
    required this.instructions,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      image: json['photo'],
      videoRecipe: json['videoRecipe'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      user: UserModelInRecipe.fromJson(json['user']),
      ingredients: (json['ingredients'] as List<dynamic>).map((ingredient) => IngredientModel.fromJson(ingredient)).toList(),
      instructions: (json['instructions'] as List<dynamic>).map((instruction) => InstructionModel.fromJson(instruction)).toList(),
      reviewsCount: json['reviewsCount'],
    );
  }
}
