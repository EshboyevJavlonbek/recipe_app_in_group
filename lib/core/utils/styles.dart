import 'package:flutter/material.dart';

import 'colors.dart';


class TextStyles {
  static const TextStyle appBarTitleStyle = TextStyle(
    color: AppColors.redPinkMain,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static const TextStyle recipeItemTitle = TextStyle(
    fontSize: 12,
    color: Colors.black,
    height: 1,
  );

  static const recipeItemDescription = TextStyle(
    fontFamily: 'League Spartan',
    fontWeight: FontWeight.w300,
    fontSize: 13,
    color: Colors.black,
    height: 1,
  );

  static const recipeSectionTitle = TextStyle(
    color: AppColors.redPinkMain,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const homeSectionTitleRedPink = TextStyle(
    color: AppColors.redPinkMain,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const homeSectionTitleWhite = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
}