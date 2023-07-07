import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/rows/rating_bar.dart';
import 'package:monasba/widgets/rows/rating_stars.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class DraggableSheetHallReview extends StatelessWidget {
  const DraggableSheetHallReview({super.key, required this.orientation});

  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(
              title: 'Users Review',
              pageMode: PageMode.dark,
              fontSize: 14.sp,
            ),
            SizedBox(height: 0.9.h),
            const RatingStars(numberOfStars: 5),
            SizedBox(height: 3.8.h),
            Column(
              children: List.generate(
                5,
                (index) => RatingBar(
                  rating: 20,
                  numberOfStars: 5 - (index),
                  orientation: orientation,
                ),
              ),
            ),
          ],
        ),
        orientation == Orientation.landscape
            ? SizedBox(width: 10.h)
            : SizedBox(width: 4.4.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 37.5.w,
              child: PageTitle(
                title: 'Write a review for this product',
                pageMode: PageMode.dark,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 1.h),
            SizedBox(
              width: 37.5.w,
              child: PageTitle(
                title: 'Share your opinions with others',
                pageMode: PageMode.dark,
                fontSize: 10.sp,
              ),
            ),
            SizedBox(height: 0.6.h),
            ColoredButton(
              title: 'View',
              pageMode: PageMode.dark,
              height: 3.6.h,
              width: 17.2.w,
              fontSize: 12.sp,
              buttonRaduis: 5,
            ),
            SizedBox(height: 12.7.h),
          ],
        )
      ],
    );
  }
}
