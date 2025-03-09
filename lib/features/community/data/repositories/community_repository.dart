import 'package:recipe/core/client.dart';
import 'package:recipe/features/community/data/models/community_model.dart';

class CommunityRepository {
  CommunityRepository({
    required this.client,
  });

  final ApiClient client;

  List<CommunityModel> community = [];

  Future<List<CommunityModel>> fetchCommunity(String order) async{
    var rawCommunity = await client.fetchCommunity(order);
    community = rawCommunity.map((recipe) => CommunityModel.fromJson(recipe)).toList();
    return community;
  }
}
