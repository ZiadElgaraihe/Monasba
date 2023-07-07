import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class HallMainInfo extends StatelessWidget {
  const HallMainInfo({
    super.key,
    required this.icon,
    required this.title,
  });

  final String icon, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.1.w),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 2.h,
            width: 36.1.w,
          ),
          SizedBox(width: 0.6.w),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 8.sp),
          ),
        ],
      ),
    );
  }
}