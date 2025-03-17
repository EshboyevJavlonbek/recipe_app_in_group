import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeCommunityRating extends StatelessWidget {
  const RecipeCommunityRating({
    super.key, required this.rating,
  });

  final num rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        SvgPicture.asset(
          "assets/icons/star.svg",
          width: 10,
          height: 10,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        Text(
          rating.toString(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
