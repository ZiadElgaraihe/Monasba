import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
    required this.rating,
    required this.numberOfStars,
    required this.orientation,
  });

  final int rating, numberOfStars;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.6.h),
      child: Row(
        children: [
          Text(
            '$rating%',
            style: TextStyle(fontSize: 11.sp, color: const Color(0xFF2ab930)),
          ),
          SizedBox(width: 1.1.w),
          Container(
            height: 2.8.h,
            width: orientation == Orientation.landscape
                ? 45.h * (rating / 100)
                : 28.3.w * (rating / 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                  left: const Radius.circular(2.5),
                  right: rating == 100
                      ? const Radius.circular(2.5)
                      : const Radius.circular(0)),
              color: const Color(0xFF2ab930),
            ),
          ),
          Container(
            height: 2.8.h,
            width: orientation == Orientation.landscape
                ? 45.h * ((100 - rating) / 100)
                : 28.3.w * ((100 - rating) / 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                right: const Radius.circular(2.5),
                left: rating == 0
                    ? const Radius.circular(2.5)
                    : const Radius.circular(0),
              ),
              color: const Color(0xFFd9d9d9),
            ),
          ),
          SizedBox(width: 1.1.w),
          Text(
            '$numberOfStars Stars',
            style: TextStyle(fontSize: 11.sp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
