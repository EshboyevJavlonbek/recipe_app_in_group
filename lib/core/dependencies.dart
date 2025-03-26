import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:recipe/data/repository/chef_repository.dart';
import 'package:recipe/data/repository/notifications_repository.dart';
import 'package:recipe/data/repository/review_repository.dart';

import '../data/repository/category_repository.dart';
import '../data/repository/recipe_repository.dart';
import '../features/auth/data/repositories/auth_repository.dart';
import 'client.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
      create: (context) => AuthRepository(client: context.read())),
  Provider(
    create: (context) => CategoryRepository(client: context.read()),
  ),
  Provider(
    create: (context) => RecipeRepository(client: context.read()),
  ),
  Provider(
    create: (context) => ChefRepository(client: context.read()),
  ),
  Provider(
    create: (context) => ReviewRepository(client: context.read()),
  ),
  Provider(
    create: (context) => NotificationsRepository(client: context.read()),
  ),
];
