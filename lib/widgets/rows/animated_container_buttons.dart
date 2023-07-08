import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class AnimatedContainerButtons extends StatelessWidget {
  const AnimatedContainerButtons({
    super.key,
    required this.onBackPressed,
    required this.onContinuePressed, required this.onClosePressed,
  });

  final Function onClosePressed, onBackPressed, onContinuePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            onClosePressed();
          },
          child: PageTitle(
            title: 'Close',
            pageMode: PageMode.dark,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(width: 28.9.w),
        TextButton(
          onPressed: () {
            onBackPressed();
          },
          child: PageTitle(
            title: 'Back',
            pageMode: PageMode.dark,
            fontSize: 12.sp,
          ),
        ),
        TextButton(
          onPressed: () {
            onContinuePressed();
          },
          child: PageTitle(
            title: 'Continue',
            pageMode: PageMode.dark,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
