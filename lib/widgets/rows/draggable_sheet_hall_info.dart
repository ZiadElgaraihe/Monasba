import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/columns/draggable_sheet_hall_images.dart';
import 'package:monasba/widgets/rows/hall_main_info.dart';
import 'package:monasba/widgets/rows/rate_row.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class DraggableSheetHallInfo extends StatelessWidget {
  const DraggableSheetHallInfo({super.key, required this.orientation});

  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DraggableSheetImages(orientation: orientation),
        orientation == Orientation.landscape
            ? SizedBox(
                width: 15.h,
              )
            : SizedBox(width: 3.9.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(
              title: 'Grand Lamour',
              pageMode: PageMode.dark,
              fontSize: 14.sp,
            ),
            SizedBox(height: 0.5.h),
            Row(
              children: [
                RateRow(
                  rate: '5.0',
                  fontSize: 8.sp,
                  iconHeight: 2.h,
                  pageMode: PageMode.dark,
                ),
                SizedBox(width: 4.4.w),
                Text(
                  '12 comments',
                  style: TextStyle(
                    color: const Color(0xFF818181),
                    fontSize: 9.sp,
                  ),
                )
              ],
            ),
            SizedBox(height: 0.5.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle(
                  title: 'Hall',
                  pageMode: PageMode.dark,
                  fontSize: 11.sp,
                ),
                SizedBox(width: 23.9.w),
                ColoredButton(
                  title: 'Visit',
                  pageMode: PageMode.dark,
                  height: 3.6.h,
                  width: 17.2.w,
                  fontSize: 12.sp,
                  buttonRaduis: 5,
                )
              ],
            ),
            SizedBox(height: 2.3.h),
            const HallMainInfo(
              icon: 'assets/icons/map/address_fill.svg',
              title: 'Address',
            ),
            SizedBox(height: 0.6.h),
            SizedBox(
              width: 48.1.w,
              height: 1.2.h,
              child: Divider(
                color: Colors.white,
                thickness: 0.1.h,
              ),
            ),
            SizedBox(height: 0.6.h),
            const HallMainInfo(
                icon: 'assets/icons/map/phone_fill.svg', title: '01200000000'),
            SizedBox(height: 1.2.h),
            const HallMainInfo(
                icon: 'assets/icons/map/website.svg', title: 'Website'),
          ],
        )
      ],
    );
  }
}
