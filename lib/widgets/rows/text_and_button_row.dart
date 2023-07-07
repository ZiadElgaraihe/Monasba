import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextAndButtonRow extends StatelessWidget {
  const TextAndButtonRow(
      {super.key,
      required this.buttonTitle,
      required this.text,
      required this.onPressed});

  final String buttonTitle;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You $text have an account . ',
          style: TextStyle(fontSize: 12.sp, color: Colors.white),
        ),
        TextButton(
          style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
              foregroundColor: MaterialStatePropertyAll(Color(0xFFed9526))),
          onPressed: () {
            onPressed();
          },
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontSize: 14.sp,
              letterSpacing: 0.14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
