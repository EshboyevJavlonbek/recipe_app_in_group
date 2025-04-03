part of'following_bloc.dart';

sealed class FollowingEvents{}

final class FollowingLoad extends FollowingEvents{
  final int chefId;
  FollowingLoad({required this.chefId});
}

final class Following extends FollowingEvents{
  final int chefId;

  Following({required this.chefId});
}

final class RemoveFollower extends FollowingEvents{
  final int chefId;

  RemoveFollower({required this.chefId});
}

final class Unfollow extends FollowingEvents{
  final int chefId;

  Unfollow({required this.chefId});
}