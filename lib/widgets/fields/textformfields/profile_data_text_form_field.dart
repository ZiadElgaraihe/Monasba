import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileDataTextFormField extends StatelessWidget {
  const ProfileDataTextFormField(
      {super.key, required this.label, required this.initValue});

  final String label, initValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.6.h,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFFEFAF4),
        border: Border(
            left: BorderSide(width: 1.w, color: const Color(0xFFed9526)),
            right: BorderSide(width: 0.5.w, color: const Color(0xFFed9526))),
      ),
      child: TextFormField(
        initialValue: initValue,
        readOnly: true,
        style: TextStyle(
            color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 4.4.w),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          label: Transform.translate(
            offset: Offset(-7.w, 100.w < 600 ? -0.70.h : -1.90.h),
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
