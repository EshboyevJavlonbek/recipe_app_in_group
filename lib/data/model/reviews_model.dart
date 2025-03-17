import 'package:recipe/data/model/user_model_in_reviews.dart';

class ReviewsModel {
  final int id;
  final String comment, image, created;
  final num rating;
  final UserModelInReviews user;

  ReviewsModel({
    required this.id,
    required this.comment,
    required this.image,
    required this.created,
    required this.rating,
    required this.user,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      id: json['id'],
      comment: json['comment'],
      image: json['image'],
      created: json['created'],
      rating: json['rating'],
      user: UserModelInReviews.fromJson(json['user']),
    );
  }
}

