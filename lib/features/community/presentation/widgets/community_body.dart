import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/features/community/presentation/manager/community_view_model.dart';
import 'package:recipe/features/community/presentation/widgets/recipe_community_item.dart';

class CommunityBodyRating extends StatelessWidget {
  const CommunityBodyRating({
    super.key,
    required this.vm,
  });

  final CommunityViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      itemCount: vm.orderByRating.length,
      itemBuilder: (BuildContext context, int index) => RecipeCommunityItem(
        profilePhoto: vm.orderByRating[index].user.image,
        username: vm.orderByRating[index].user.username,
        time: vm.orderByRating[index].created,
        image: vm.orderByRating[index].photo,
        title: vm.orderByRating[index].title,
        desc: vm.orderByRating[index].description,
        timeRequired: vm.orderByRating[index].timeRequired,
        comments: vm.orderByRating[index].reviewsCount,
        rating: vm.orderByRating[index].rating,
        id: vm.orderByRating[index].id,
      ),
    );
  }
}
class CommunityBodyOldest extends StatelessWidget {
  const CommunityBodyOldest({
    super.key,
    required this.vm,
  });

  final CommunityViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      itemCount: vm.orderByOldest.length,
      itemBuilder: (BuildContext context, int index) => RecipeCommunityItem(
        profilePhoto: vm.orderByOldest[index].user.image,
        username: vm.orderByOldest[index].user.username,
        time: vm.orderByOldest[index].created,
        image: vm.orderByOldest[index].photo,
        title: vm.orderByOldest[index].title,
        desc: vm.orderByOldest[index].description,
        timeRequired: vm.orderByOldest[index].timeRequired,
        comments: vm.orderByOldest[index].reviewsCount,
        rating: vm.orderByOldest[index].rating,
        id: vm.orderByOldest[index].id,
      ),
    );
  }
}
class CommunityBodyNewest extends StatelessWidget {
  const CommunityBodyNewest({
    super.key,
    required this.vm,
  });

  final CommunityViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      itemCount: vm.orderByNewest.length,
      itemBuilder: (BuildContext context, int index) => RecipeCommunityItem(
        profilePhoto: vm.orderByNewest[index].user.image,
        username: vm.orderByNewest[index].user.username,
        time: vm.orderByNewest[index].created,
        image: vm.orderByNewest[index].photo,
        title: vm.orderByNewest[index].title,
        desc: vm.orderByNewest[index].description,
        timeRequired: vm.orderByNewest[index].timeRequired,
        comments: vm.orderByNewest[index].reviewsCount,
        rating: vm.orderByNewest[index].rating,
        id: vm.orderByNewest[index].id,
      ),
    );
  }
}
