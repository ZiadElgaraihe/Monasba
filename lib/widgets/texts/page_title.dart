import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class PageTitle extends StatelessWidget {
  const PageTitle(
      {super.key, required this.title, required this.pageMode, this.fontSize});

  final PageMode pageMode;
  final String title;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: TextStyle(
          color: pageMode == PageMode.light ? Colors.black : Colors.white,
          fontSize: fontSize ?? 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
