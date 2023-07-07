import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.9.h, horizontal: 5.6.w),
      height: 7.7.h,
      // width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 1.4.h,
            width: 2.5.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF1672ec),
            ),
          ),
          SizedBox(width: 4.4.w),
          Container(
            height: 7.5.h,
            width: 13.3.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF2b2b2b),
            ),
          ),
          SizedBox(width: 6.7.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Message Content',
                style: TextStyle(
                  color: const Color(0xFF1672ec),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'month day , year at time',
                style: TextStyle(
                  color: const Color(0xFF686868),
                  fontSize: 12.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
