import 'package:recipe/core/client.dart';
import 'package:recipe/data/model/top_chef_model_small.dart';

class ChefRepository{
  ChefRepository({required this.client});
  final ApiClient client;
  List<TopChefModelSmall> topChefs = [];

  Future<List<TopChefModelSmall>> fetchTopChefsForHome({int? limit})async{
    var rawChef = await client.fetchTopChefsForHome(limit: limit);
    topChefs = rawChef.map((chef) => TopChefModelSmall.fromJson(chef)).toList();
    return topChefs;
  }
}