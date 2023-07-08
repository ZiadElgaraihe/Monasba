import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class PhoneNumberRow extends StatelessWidget {
  const PhoneNumberRow({super.key, required this.pageMode});

  final PageMode pageMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          height: 3.8.h,
          width: 13.w,
          child: Text(
            '+20',
            style: TextStyle(
                color: pageMode == PageMode.dark
                    ? const Color(0xFFed9526)
                    : const Color(0xFF087e8b),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          '1207420805',
          style: TextStyle(
              color: pageMode == PageMode.dark
                  ? const Color(0xFFb0b0b0)
                  : const Color(0xFF686868),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
