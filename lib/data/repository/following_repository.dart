import 'package:recipe/core/client.dart';
import 'package:recipe/data/model/recipe/user_model_in_recipe.dart';

class FollowingRepository{
  FollowingRepository({required this.client});

  final ApiClient client;

  List<UserModelInRecipe> followings = [];
  List<UserModelInRecipe> followers = [];

  Future<List<UserModelInRecipe>> getFollowing(int chefId) async{
    var rawChef = await client.genericGetRequest<List<dynamic>>('/auth/followers/$chefId');
    followings = rawChef.map((chef) => UserModelInRecipe.fromJson(chef)).toList();
    return followings;
  }

  Future<List<UserModelInRecipe>> getFollower(int chefId) async{
    var rawChef = await client.genericGetRequest<List<dynamic>>('/auth/followings/$chefId');
    followers = rawChef.map((chefId) => UserModelInRecipe.fromJson(chefId)).toList();
    return followers;
  }

  Future<bool> fetchFollow(int chefId) async{
    var follow = client.genericPostRequest<bool>('/auth/follow/$chefId');
    return follow;
  }

  Future<bool> fetchUnfollow(int chefId) async{
    var unfollow = client.genericPostRequest<bool>('/auth/unfollow/$chefId');
    return unfollow;
  }

  Future<bool> fetchRemoveFollower(int chefId) async{
    final removeFollower = await client.genericPostRequest('/auth/remove-follower/$chefId');
    return removeFollower;
  }
}