import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/categories/data/models/category_model.dart';
import 'package:recipe/features/categories/data/repositories/category_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required CategoryRepository catRepo})
      : _catRepo = catRepo,
        super(
          CategoriesState(categories: [], mainCategory: null),
        ) {
    load();
  }

  final CategoryRepository _catRepo;

  Future<void> load() async {
    final allCategories = await _catRepo.fetchCategories();
    emit(
      CategoriesState(
        categories: allCategories.where((category) => !category.isMain).toList(),
        mainCategory: allCategories.firstWhere((category) => category.isMain),
      ),
    );
  }
}
