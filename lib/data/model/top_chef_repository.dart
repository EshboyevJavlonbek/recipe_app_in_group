import 'package:recipe/core/client.dart';
import 'package:recipe/data/model/top_chef_model.dart';

class TopChefRepository{
  TopChefRepository({required this.client});
  final ApiClient client;
  List<TopChefModel> chefs = [];

  Future<List<TopChefModel>> fetchTopChefs()async{
    var rawTopChef = await client.fetchTopChef();
    chefs = rawTopChef.map((chef) => TopChefModel.fromJson(chef)).toList();
    return chefs;
  }
}