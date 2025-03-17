import 'package:flutter/material.dart';
import 'package:recipe/data/model/community_model.dart';
import 'package:recipe/data/repository/recipe_repository.dart';

class CommunityViewModel extends ChangeNotifier{
  CommunityViewModel({required RecipeRepository repo}): _repo = repo{
    load();
  }

  final RecipeRepository _repo;

  List<CommunityModel> orderByRating = [];
  List<CommunityModel> orderByOldest = [];
  List<CommunityModel> orderByNewest = [];


  Future<void> load() async {
    orderByRating = await _repo.fetchCommunity("rating");
    notifyListeners();
    orderByOldest = await _repo.fetchCommunity("date&Descending=false");
    notifyListeners();
    orderByNewest = await _repo.fetchCommunity("date&Descending=true");
    notifyListeners();
  }
}