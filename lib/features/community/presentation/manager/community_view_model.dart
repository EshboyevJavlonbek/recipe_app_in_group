import 'package:flutter/material.dart';
import 'package:recipe/features/community/data/models/community_model.dart';
import 'package:recipe/features/community/data/repositories/community_repository.dart';

class CommunityViewModel extends ChangeNotifier{
  CommunityViewModel({required CommunityRepository repo}): _repo = repo{
    load();
  }

  final CommunityRepository _repo;

  List<CommunityModel> orderByRating = [];
  List<CommunityModel> orderByOldest = [];
  List<CommunityModel> orderByNewest = [];


  Future<void> load() async {
    orderByRating = await _repo.fetchCommunity("rating");
    notifyListeners();
    orderByOldest = await _repo.fetchCommunity("time@Descending=false");
    notifyListeners();
    orderByNewest = await _repo.fetchCommunity("time@Descending=true");
    notifyListeners();
  }
}