import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/repository/reviews_repository.dart';
import 'package:recipe/features/reviews/manager/reviews_state.dart';

import '../../../../data/repository/recipe_repository.dart';

part 'reviews_events.dart';

class ReviewsBloc extends Bloc<ReviewsEvents, ReviewsState>{
  ReviewsBloc({
    required RecipeRepository recipeRepo,
    required int recipeId,
    required ReviewsRepository reviewsRepo,
}):_recipeRepo = recipeRepo, _reviewsRepo = reviewsRepo,super(ReviewsState(recipeModel: null, status: ReviewsStatus.loading, reviews: [])){
    on<ReviewsLoading>(_onLoad);
    add(ReviewsLoading(recipeId: recipeId));
  }
  final RecipeRepository _recipeRepo;
  final ReviewsRepository _reviewsRepo;

  Future<void> _onLoad(ReviewsLoading event, Emitter<ReviewsState> emit) async {
    emit(state.copyWith(status: ReviewsStatus.loading));
    final recipe = await _recipeRepo.fetchRecipeForReviews(event.recipeId);
    final reviews = await _reviewsRepo.fetchReviews(event.recipeId);
    emit(state.copyWith(recipeModel: recipe, status: ReviewsStatus.idle, reviews: reviews));
  }
}