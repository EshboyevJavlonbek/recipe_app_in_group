import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/reviews_recipe_model.dart';
import '../../../data/model/reviews_model.dart';

enum ReviewsStatus { idle, loading, error }

@immutable
class ReviewsState extends Equatable {
  final ReviewsStatus status;
  final ReviewsRecipeModel? recipeModel;
  final List<ReviewsModel> reviews;

  const ReviewsState({
    required this.recipeModel,
    required this.status,
    required this.reviews,
  });

  ReviewsState copyWith({ReviewsRecipeModel? recipeModel, ReviewsStatus? status, List<ReviewsModel>? reviews,}) {
    return ReviewsState(
      recipeModel: recipeModel ?? this.recipeModel,
      status: status ?? this.status,
      reviews: reviews ?? this.reviews,
    );
  }

  @override
  List<Object?> get props => [recipeModel, status, reviews];
}
