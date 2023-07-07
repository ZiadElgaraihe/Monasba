import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class PageDefinition extends StatelessWidget {
  const PageDefinition(
      {super.key, required this.title, required this.pageMode});

  final PageMode pageMode;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: TextStyle(
          color: pageMode == PageMode.light
              ? const Color(0xFF686868)
              : const Color(0xFFb0b0b0),
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
