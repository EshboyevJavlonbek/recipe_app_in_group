part of 'categories_cubit.dart';

class CategoriesState {
  CategoriesState({
    required this.categories,
    required this.mainCategory,
  });

  final List<CategoryModel> categories;
  final CategoryModel? mainCategory;
}