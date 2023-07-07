import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class FacebookAndGoogleButtons extends StatelessWidget {
  const FacebookAndGoogleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Transform.scale(
            scale: 0.13.h,
            child: FloatingActionButton(
              heroTag: 'google',
              onPressed: () {},
              backgroundColor: Colors.white,
              elevation: 2,
              child: SvgPicture.asset(
                'assets/icons/logos/Google logo.svg',
                height: 28,
                width: 28,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8.9.w,
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Transform.scale(
            scale: 0.13.h,
            child: FloatingActionButton(
              heroTag: 'facebook',
              elevation: 2,
              onPressed: () {},
              backgroundColor: const Color(0xFF0165E1),
              child: SvgPicture.asset(
                'assets/icons/logos/Facebook logo.svg',
                height: 28, //=>
                width: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
