import 'package:flutter/material.dart';
import 'package:recipe/core/utils/colors.dart';

class RecipeDetailUsernameItem extends StatelessWidget {
  const RecipeDetailUsernameItem({
    super.key,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.color = AppColors.redPinkMain,
  });

  final String username, firstName, lastName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overflow: TextOverflow.ellipsis,
          "@$username",
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins",
          ),
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          "$firstName $lastName",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            fontFamily: "League Spartan",
          ),
        ),
      ],
    );
  }
}
