import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.name,
    this.bottom,
    this.toolbarHeight = 72,
  });

  final String name;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height = bottomHeight == null ? toolbarHeight : bottomHeight + toolbarHeight;
    return Size(double.infinity, height);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: AppBar(
        toolbarHeight: toolbarHeight,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi! $name",
              style: TextStyle(
                color: AppColors.redPinkMain,
                fontSize: 25.31,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
              ),
            ),
            Text(
              "What are you cooking today",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.45,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () {},
            iconWidth: 12,
            iconHeight: 17.32,
          ),
          SizedBox(width: 5.w),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            callback: () {},
            iconWidth: 12,
            iconHeight: 17.54,
          ),
          SizedBox(width: 36.w),
        ],
        bottom: bottom,
      ),
    );
  }
}
