import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopChefItem extends StatelessWidget {
  const TopChefItem({
    super.key,
    required this.image,
    required this.name,
  });

  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Image.network(
            image,
            width: 83.w,
            height: 74.h,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
