import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/repository/category_repository.dart';
import '../data/repository/recipe_repository.dart';
import 'client.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => CategoryRepository(client: context.read()),
  ),
  Provider(
    create: (context) => RecipeRepository(client: context.read()),
  ),
];
