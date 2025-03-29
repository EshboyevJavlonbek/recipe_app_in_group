import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/features/common/common.dart';

class RecipeCreate extends StatelessWidget {
  const RecipeCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(
        title: "Create Recipe",
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        children: [
          Row(),
        ],
      ),
    );
  }
}
