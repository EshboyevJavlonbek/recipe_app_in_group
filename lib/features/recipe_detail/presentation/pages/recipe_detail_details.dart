import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe/features/recipe_detail/presentation/manager/recipe_detail_view_model.dart';
import 'package:recipe/features/recipe_detail/presentation/pages/recipe_detail_title.dart';

class RecipeDetailDetails extends StatelessWidget {
  const RecipeDetailDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var vm = context.read<RecipeDetailViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Row(
          spacing: 5,
          children: [
            RecipeDetailTitle(title: "Details",),
            SizedBox(width: 5),
            SvgPicture.asset(
              "assets/icons/clock.svg",
              width: 10,
              height: 10,
              colorFilter: ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            Text(
              "${vm.recipe.timeRequired.toString()} min",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
        Text(
          vm.recipe.description,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins",
          ),
        ),
      ],
    );
  }
}
