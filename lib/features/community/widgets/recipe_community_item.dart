import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/community/widgets/recipe_community_product.dart';

import 'community_profile.dart';

class RecipeCommunityItem extends StatelessWidget {
  const RecipeCommunityItem({
    super.key,
    required this.profilePhoto,
    required this.username,
    required this.time,
    required this.image,
    required this.title,
    required this.desc,
    required this.timeRequired,
    required this.comments,
    required this.rating,
    required this.id,
  });

  final String profilePhoto, username, time, image, title, desc;
  final int timeRequired, comments, id;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        CommunityProfile(
          image: profilePhoto,
          username: username,
          time: time,
        ),
        RecipeCommunityProduct(
          image: image,
          title: title,
          rating: rating,
          desc: desc,
          timeRequired: timeRequired,
          comments: comments,
          id: id,
        ),
        Divider(
          color: AppColors.redPinkMain,
        ),
      ],
    );
  }
}
