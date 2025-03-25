import 'package:equatable/equatable.dart';
import 'package:recipe/data/model/chef/top_chef_profile_model.dart';

enum TopChefProfileStatus { idle, loading, error }

class TopChefProfileState extends Equatable {
  final TopChefProfileModel? profileModel;
  final TopChefProfileStatus status;

  const TopChefProfileState({
    required this.profileModel,
    required this.status,
  });

  factory TopChefProfileState.initial() {
    return TopChefProfileState(
      profileModel: null,
      status: TopChefProfileStatus.loading,
    );
  }

  TopChefProfileState copyWith({TopChefProfileModel? profileModel, TopChefProfileStatus? status}) {
    return TopChefProfileState(
      profileModel: profileModel ?? this.profileModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [profileModel, status];
}
