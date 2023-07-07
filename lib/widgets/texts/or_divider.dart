import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key, required this.pageMode});

  final PageMode pageMode;

  @override
  Widget build(BuildContext context) {
    Color color = pageMode == PageMode.light
        ? const Color(0xFF757575)
        : const Color(0xFFb0b0b0);
    return SizedBox(
      height: 3.4.h,
      width: 64.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              color: color,
              thickness: 0.1.h,
            ),
          ),
          SizedBox(
            width: 8.8.w,
          ),
          Text(
            'OR',
            style: TextStyle(
              letterSpacing: 0.08.sp,
              color: color,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            width: 8.8.w,
          ),
          Expanded(
            child: Divider(
              color: color,
              thickness: 0.1.h,
            ),
          ),
        ],
      ),
    );
  }
}
