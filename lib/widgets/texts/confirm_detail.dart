import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConfirmDetail extends StatelessWidget {
  const ConfirmDetail({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.4.w),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}
