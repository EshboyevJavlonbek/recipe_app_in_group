import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_eleveted_button.dart';
import 'package:recipe/features/recipe_detail/presentation/manager/recipe_detail_view_model.dart';
import 'package:recipe/features/recipe_detail/presentation/pages/recipe_detail_username_item.dart';

class RecipeDetailProfile extends StatelessWidget {
  const RecipeDetailProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var vm = context.read<RecipeDetailViewModel>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            vm.recipe.image,
            width: 61,
            height: 63,
            fit: BoxFit.cover,
          ),
        ),
        RecipeDetailUsernameItem(
          username: vm.recipe.user.username,
          firstName: vm.recipe.user.firstName,
          lastName: vm.recipe.user.lastName,
        ),
        SizedBox(width: 10),
        RecipeElevatedButton(
          text: "Following",
          callback: () {},
          size: Size(107, 21),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/three_dots.svg",
            width: 4,
            height: 15,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
