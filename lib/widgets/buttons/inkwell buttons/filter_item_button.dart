import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class FilterItemButton extends StatelessWidget {
  const FilterItemButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.appearLeftTrend,
  });

  final String title;
  final Function onTap;
  final bool appearLeftTrend;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 1.h),
          padding: EdgeInsets.symmetric(vertical: 0.2.h, horizontal: 4.4.w),
          child: Row(
            children: [
              Text(title,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp)),
              const Spacer(),
              appearLeftTrend
                  ? SvgPicture.asset(
                      'assets/icons/trends/Left.svg',
                      height: 3.8.h,
                      width: 6.7.w,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                          Colors.white, BlendMode.srcATop),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
