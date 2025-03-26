import 'package:equatable/equatable.dart';
import 'package:recipe/data/model/recipe/recipe_model.dart';

enum MyRecipesStatus { idle, loading, error }

class MyRecipesState extends Equatable {
  final MyRecipesStatus status;
  final List<RecipeModel> recipes;


  const MyRecipesState({
    required this.status,
    required this.recipes,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
