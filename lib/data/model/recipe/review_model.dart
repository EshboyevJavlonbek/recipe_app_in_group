import 'package:recipe/data/model/user_in_review_model.dart';

class ReviewModel {
  final int id;
  final String comment;
  final int rating;
  final UserInReviewModel user;
  final DateTime created;

  ReviewModel({
    required this.id,
    required this.comment,
    required this.created,
    required this.rating,
    required this.user,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      comment: json['comment'],
      created: DateTime.parse(json['created']),
      rating: json['rating'],
      user: UserInReviewModel.fromJson(json['user']),
    );
  }
}

