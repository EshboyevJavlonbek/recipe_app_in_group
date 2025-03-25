import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/repository/chef_repository.dart';
import 'package:recipe/features/top_chefs/manager/top_chef_profile/top_chef_profile_state.dart';

part 'top_chef_profile_events.dart';

class TopChefProfileBloc extends Bloc<TopChefProfileEvents, TopChefProfileState> {
  TopChefProfileBloc({
    required ChefRepository profileRepo,
    required int chefId,
  })  : _profileRepo = profileRepo,
        super(TopChefProfileState.initial()) {
    on<TopChefProfileLoading>(_onLoad);
    add(TopChefProfileLoading(chefId: chefId));
  }

  final ChefRepository _profileRepo;

  Future<void> _onLoad(TopChefProfileLoading event, Emitter<TopChefProfileState> emit)async{
    emit(state.copyWith(status: TopChefProfileStatus.loading));
    var rawChefProfile = await _profileRepo.fetchChefProfile(event.chefId);
    emit(state.copyWith(profileModel: rawChefProfile, status: TopChefProfileStatus.idle));
  }
}
