import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';

class RateRow extends StatelessWidget {
  const RateRow(
      {super.key,
      required this.rate,
      required this.fontSize,
      required this.iconHeight,
      this.pageMode});

  final String rate;
  final double fontSize, iconHeight;
  final PageMode? pageMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/star_colored.svg',
          height: iconHeight,
        ),
        Text(rate,
            style: TextStyle(
                color: pageMode == PageMode.dark ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: fontSize))
      ],
    );
  }
}