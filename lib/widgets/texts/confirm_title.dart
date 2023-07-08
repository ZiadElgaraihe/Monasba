import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConfirmTitle extends StatelessWidget {
  const ConfirmTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
    );
  }
}
