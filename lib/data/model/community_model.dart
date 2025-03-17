import 'package:recipe/data/model/user_model_in_recipe.dart';

class CommunityModel {
  final String title, description, photo, created;
  final int id, timeRequired, reviewsCount;
  final num rating;
  final UserModelInRecipe user;

  CommunityModel({
    required this.title,
    required this.description,
    required this.photo,
    required this.created,
    required this.id,
    required this.timeRequired,
    required this.rating,
    required this.reviewsCount,
    required this.user,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      created: json['created'],
      id: json['id'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      reviewsCount: json['reviewsCount'],
      user: UserModelInRecipe.fromJson(json['user']),
    );
  }
}
