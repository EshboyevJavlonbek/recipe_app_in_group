import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipe/data/model/recipe/user_model_in_recipe.dart';

enum FollowingStatus { idle, loading, error }

@immutable
class FollowingState extends Equatable {
  final List<UserModelInRecipe>? following;
  final List<UserModelInRecipe>? follower;
  final int? chefId;
  final FollowingStatus status;

  const FollowingState({
    required this.following,
    required this.follower,
    required this.chefId,
    required this.status,
  });

  factory FollowingState.initial() {
    return FollowingState(
      following: [],
      follower: [],
      chefId: null,
      status: FollowingStatus.loading,
    );
  }

  FollowingState copyWith({
    List<UserModelInRecipe>? following,
    List<UserModelInRecipe>? follower,
    int? chefId,
    FollowingStatus? status,
  }) {
    return FollowingState(
      following: following ?? this.following,
      follower: follower ?? this.follower,
      chefId: chefId ?? this.chefId,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [following, follower, chefId,status];
}
