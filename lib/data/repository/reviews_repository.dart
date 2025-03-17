import 'package:recipe/core/client.dart';
import 'package:recipe/data/model/reviews_model.dart';

class ReviewsRepository{
  ReviewsRepository({required this.client});

  final ApiClient client;

  List<ReviewsModel> reviews = [];

  Future<List<ReviewsModel>> fetchReviews(int reviewId) async {
    var rawReviews = await client.fetchReviews(reviewId);
    reviews = rawReviews.map((review) => ReviewsModel.fromJson(review)).toList();
    return reviews;
  }
}