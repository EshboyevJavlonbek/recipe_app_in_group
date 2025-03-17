import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:recipe/core/utils/colors.dart';

class CommunityProfile extends StatelessWidget {
   const CommunityProfile({
    super.key,
    required this.image,
    required this.username,
    required this.time,
  });

  final String image, username, time;


  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(time);

    DateTime currentDate = DateTime.now();

    Duration differance = currentDate.difference(dateTime);

    String formatedTime = _getTimeAgo(differance);
    return Row(
      spacing: 10.w,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: image,
            width: 61.w,
            height: 63.h,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@$username",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "$formatedTime ago",
              style: TextStyle(
                color: AppColors.pinkSub,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
  String _getTimeAgo(Duration differance){
    if (differance.inDays > 365) {
      return "${(differance.inDays / 365).floor()} year";
    }else if(differance.inDays > 30){
      return "${(differance.inDays / 30).floor()} month";
    }else if(differance.inDays > 7){
      return "${(differance.inDays / 7).floor()} weak";
    }else if(differance.inDays > 0){
      return "${(differance.inDays)} days";
    }else if(differance.inHours > 0){
      return "${(differance.inHours)} hours";
    }else if(differance.inMinutes > 0){
      return "${(differance.inMinutes)} minutes";
    }else{
      return"${(differance.inSeconds)} seconds";
    }
  }
}
