import 'package:equatable/equatable.dart';
import 'package:recipe/data/model/recipe/recipe_model.dart';

enum MyRecipesStatus { idle, loading, error }

class MyRecipesState extends Equatable {
  final MyRecipesStatus status;
  final List<RecipeModel> recipes;
  final List<RecipeModel> mostViewed;

  const MyRecipesState({
    required this.status,
    required this.recipes,
    required this.mostViewed,
  });

  factory MyRecipesState.initial() {
    return MyRecipesState(
      status: MyRecipesStatus.loading,
      recipes: [],
      mostViewed: [],
    );
  }

  MyRecipesState copyWith({List<RecipeModel>? recipes, List<RecipeModel>? mostViewed, MyRecipesStatus? status}) {
    return MyRecipesState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
      mostViewed: mostViewed ?? this.mostViewed,
    );
  }

  @override
  List<Object?> get props => [status, recipes, mostViewed];
}
