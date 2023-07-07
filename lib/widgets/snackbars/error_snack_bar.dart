import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

SnackBar errorSnackBar({required String msg}) {
  return SnackBar(
    content: Text(
      msg,
      style: TextStyle(color: Colors.black, fontSize: 12.sp),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.white,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    width: 64.4.w,
  );
}
