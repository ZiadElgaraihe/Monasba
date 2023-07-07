import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    required this.width,
    required this.height,
    required this.asset,
    this.padding,
    this.onTap,
  });

  final double width, height;
  final String asset;
  final EdgeInsetsGeometry? padding;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
          color: const Color(0xFFED9526),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          borderRadius: BorderRadius.circular(50),
          child: Padding(
            padding: EdgeInsets.all(0.25.h),
            child: SvgPicture.asset(
              asset,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcATop),
            ),
          ),
        ),
      ),
    );
  }
}
