import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/reviews/pages/recipe_reviews.dart';
import 'package:recipe/features/reviews/widgets/recipe_reviews_item.dart';

import '../manager/reviews_bloc.dart';
import '../manager/reviews_state.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, state) {
        if (state.reviews.isEmpty) {
          return Scaffold(
            appBar: RecipeAppBar(title: "Reviews", actions: null),
            body: Center(
              child: Text("No reviews available."),
            ),
            bottomNavigationBar: RecipeBottomNavigationBar(),
          );
        }
        return Scaffold(
          appBar: RecipeAppBar(title: "Reviews", actions: null),
          extendBody: true,
          body: ListView(
            padding: EdgeInsets.only(bottom: 5),
            children: [
              RecipeReviewsItem(),
              SizedBox(height: 15),
              RecipeReviews(),
            ],
          ),
          bottomNavigationBar: RecipeBottomNavigationBar(),
        );
      },
    );
  }
}
