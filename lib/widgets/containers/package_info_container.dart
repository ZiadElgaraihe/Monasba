import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PackageInfoContainer extends StatelessWidget {
  const PackageInfoContainer(
      {super.key, required this.title, required this.content});

  final String title, content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.only(top: 1.3.h, left: 2.2.w, right: 2.2.w, bottom: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
          SizedBox(height: 1.3.h),
          Text(
            content,
            style: TextStyle(color: const Color(0xFFdfdfdf), fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
