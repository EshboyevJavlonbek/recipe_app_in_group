import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/repository/recipe_repository.dart';
import 'package:recipe/features/my_recipes/manager/my_recipes_state.dart';

part 'my_recipes_events.dart';

class MyRecipesBloc extends Bloc<MyRecipesEvents, MyRecipesState>{
  MyRecipesBloc({required RecipeRepository recipeRepo}): _recipeRepo = recipeRepo, super(MyRecipesState.initial()){
    on<MyRecipesLoad>(_onLoad);
    add(MyRecipesLoad());
  }

  final RecipeRepository _recipeRepo;

  Future<void> _onLoad(MyRecipesEvents event, Emitter<MyRecipesState> emit)async{
    emit(state.copyWith(status: MyRecipesStatus.loading));
    final rawMostViewedRecipes = await _recipeRepo.fetchYourRecipes(limit: 2);
    final rawMyRecipes = await _recipeRepo.fetchMyRecipes();
    emit(state.copyWith(recipes: rawMyRecipes, mostViewed: rawMostViewedRecipes, status: MyRecipesStatus.idle));
  }
}