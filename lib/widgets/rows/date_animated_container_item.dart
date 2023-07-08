import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class ReservationItem extends StatelessWidget {
  const ReservationItem({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    required this.pageMode,
  });

  final String icon;
  final String title;
  final String? value;
  final PageMode pageMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.5.h,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 3.8.h,
            width: 6.7.w,
            colorFilter: ColorFilter.mode(
              pageMode == PageMode.dark
                  ? Colors.white
                  : const Color(0xFF686868),
              BlendMode.srcATop,
            ),
          ),
          SizedBox(width: 2.2.w),
          Text(
            value ?? title,
            style: TextStyle(
              color: pageMode == PageMode.dark
                  ? Colors.white
                  : const Color(0xFF686868),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (value == null) const Spacer(),
          if (value == null)
            SvgPicture.asset(
              'assets/icons/trends/Left.svg',
              height: 3.8.h,
              width: 6.7.w,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcATop),
            ),
        ],
      ),
    );
  }
}
