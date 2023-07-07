import 'package:flutter/material.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/circular_icon_button.dart';
import 'package:monasba/widgets/rows/location_row.dart';
import 'package:monasba/widgets/rows/rate_row.dart';
import 'package:monasba/widgets/texts/place_name_text.dart';
import 'package:sizer/sizer.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key, required this.asset, required this.onTap});

  final String asset;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 9.5.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 9.5.h,
              width: 16.9.w,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/Rectangle 4233.png'),
              ),
            ),
            SizedBox(width: 4.7.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PlaceNameText(title: 'Name of Place'),
                const LocationRow(city: 'City', country: 'Country'),
                RateRow(rate: '4.5', iconHeight: 1.9.h, fontSize: 10.sp),
              ],
            ),
            const Spacer(),
            CircularIconButton(
              width: 6.7.w,
              height: 3.8.h,
              padding: EdgeInsets.all(0.25.h),
              asset: asset,
            ),
          ],
        ),
      ),
    );
  }
}
