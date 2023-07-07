import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({
    super.key,
    required this.title,
    required this.detail,
  });

  final String title, detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF686868)),
        ),
        SizedBox(width: 2.2.w),
        Text(
          detail,
          style: TextStyle(fontSize: 14.sp, color: const Color(0xFF686868)),
        ),
      ],
    );
  }
}
