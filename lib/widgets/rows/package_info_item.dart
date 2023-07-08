import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PackageInfoItem extends StatelessWidget {
  const PackageInfoItem(
      {super.key,
      required this.value,
      required this.title,
      required this.color});

  final String value, title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 1.1.w),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
