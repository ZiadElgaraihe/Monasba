import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class BottomSheetInkWell extends StatelessWidget {
  const BottomSheetInkWell({
    super.key,
    required this.title,
    required this.trailingIcon,
  });

  final String title, trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
            title: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
            trailing: SvgPicture.asset(
              trailingIcon,
              height: 3.8.h,
              width: 6.7.w,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
