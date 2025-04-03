import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/repository/following_repository.dart';
import 'package:recipe/features/following/manager/following_state.dart';

part 'following_events.dart';

class FollowingBloc extends Bloc<FollowingEvents, FollowingState> {
  FollowingBloc({
    required FollowingRepository followingRepo,
    required int chefId,
  }) : _followingRepo = followingRepo, super(FollowingState.initial()){
    on<FollowingLoad>(_onLoad);
    add(FollowingLoad(chefId: chefId));
  }
  final FollowingRepository _followingRepo;

  Future<void> _onLoad(FollowingLoad event, Emitter<FollowingState> emit) async{
    emit(state.copyWith(status: FollowingStatus.loading));
    final followings = await _followingRepo.getFollowing(event.chefId);
    final followers =await _followingRepo.getFollower(event.chefId);
    emit(state.copyWith(following: followings, follower: followers,status: FollowingStatus.idle));
  }
}
