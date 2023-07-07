import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class TimePickerContainer extends StatelessWidget {
  const TimePickerContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 4.4.w,
        right: 4.4.w,
        top: 14.h,
        bottom: 2.5.h,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      // height: 100,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  splashRadius: 20,
                  icon: SvgPicture.asset('assets/icons/trends/Left.svg',
                      height: 3.8.h,
                      width: 6.7.w,
                      colorFilter: const ColorFilter.mode(
                          Colors.white, BlendMode.srcATop)),
                ),
              ),
            ),
            Theme(data: timePickerThemeData, child: child),
          ],
        ),
      ),
    );
  }
}
