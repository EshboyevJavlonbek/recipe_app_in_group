import 'package:recipe/data/model/recipe/user_model_in_recipe.dart';

class CommunityRecipeModel {
  final String title, description, image;
  final int id, timeRequired, reviewsCount;
  final num rating;
  final DateTime created;
  final UserModelInRecipe user;

  CommunityRecipeModel({
    required this.title,
    required this.description,
    required this.image,
    required this.created,
    required this.id,
    required this.timeRequired,
    required this.rating,
    required this.reviewsCount,
    required this.user,
  });

  factory CommunityRecipeModel.fromJson(Map<String, dynamic> json) {
    return CommunityRecipeModel(
      title: json['title'],
      description: json['description'],
      image: json['photo'],
      id: json['id'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      reviewsCount: json['reviewsCount'],
      created: DateTime.parse(json['created']),
      user: UserModelInRecipe.fromJson(json['user']),
    );
  }
}
