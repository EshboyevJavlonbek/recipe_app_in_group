part of'top_chef_profile_bloc.dart';

sealed class TopChefProfileEvents{}

final class TopChefProfileLoading extends TopChefProfileEvents{
  final int chefId;
  TopChefProfileLoading({required this.chefId});
}