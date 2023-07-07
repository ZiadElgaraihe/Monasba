import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class DateAnimatedContainerItem extends StatelessWidget {
  const DateAnimatedContainerItem({
    super.key,
    required this.icon,
    required this.title,
    this.value,
  });

  final IconData icon;
  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.5.h,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 6.7.w,
          ),
          SizedBox(width: 2.2.w),
          PageTitle(
            title: value ?? title,
            pageMode: PageMode.dark,
            fontSize: 16.sp,
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
