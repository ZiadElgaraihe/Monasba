import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.numberOfStars,
  });

  final double numberOfStars;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 3.4.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, starsIndex) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.3.w),
              child: SvgPicture.asset(
                'assets/icons/star_colored.svg',
                height: 3.1.h,
                colorFilter: ColorFilter.mode(
                    (starsIndex < numberOfStars)
                        ? const Color(0xFFff9529)
                        : const Color(0xFFdfdfdf),
                    BlendMode.srcATop),
              ),
            ),
          ),
        ),
        SizedBox(width: 1.4.w),
        Text(
          '$numberOfStars',
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
      ],
    );
  }
}
