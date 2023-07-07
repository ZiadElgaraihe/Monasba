import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.textDirection,
    required this.msg,
  });

  final String msg;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(10),
              bottomEnd: Radius.circular(10),
              topEnd: Radius.circular(10),
            ),
          ),
          margin: EdgeInsetsDirectional.only(
              start: 4.4.w, end: 4.4.w, bottom: 1.3.h),
          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.7.w),
          child: Text(
            msg,
            textWidthBasis: TextWidthBasis.longestLine,
            // textAlign: TextAlign.end,
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
