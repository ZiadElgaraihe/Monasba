import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class ColoredButton extends StatelessWidget {
  const ColoredButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.pageMode,
    this.width,
    this.height,
    this.fontSize,
    this.buttonRaduis = 10,
  });

  final double? height, width, fontSize;
  final Function? onPressed;
  final PageMode pageMode;
  final String title;
  final double buttonRaduis;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      style: ButtonStyle(
        overlayColor: const MaterialStatePropertyAll(Colors.grey),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonRaduis))),
        backgroundColor: MaterialStatePropertyAll(
            pageMode == PageMode.light ? Colors.black : Colors.white),
        fixedSize: MaterialStatePropertyAll(Size(width ?? 51.w, height ?? 5.h)),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: pageMode == PageMode.light ? Colors.white : Colors.black,
          fontSize: fontSize ?? 13.sp,
        ),
      ),
    );
  }
}
