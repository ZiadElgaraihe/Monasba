import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/widgets/rows/location_row.dart';
import 'package:monasba/widgets/rows/rate_row.dart';
import 'package:monasba/widgets/texts/place_name_text.dart';
import 'package:sizer/sizer.dart';

class PlaceStack extends StatelessWidget {
  const PlaceStack(
      {super.key, required this.title, required this.onTap, this.orientation});

  final String title;
  final Function onTap;
  final Orientation? orientation;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 6.7.w,
          mainAxisExtent: 32.h,
          crossAxisCount: orientation == Orientation.landscape ? 3 : 2),
      itemCount: 4,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          onTap();
        },
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 23.4.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(height: 1.3.h),
                PlaceNameText(title: title),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LocationRow(city: 'City', country: 'Country'),
                    const Spacer(),
                    RateRow(rate: '4.5', iconHeight: 1.9.h, fontSize: 10.sp),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 1.3.h,
              right: 2.2.w,
              child: Container(
                width: 8.3.w,
                height: 4.7.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF343434),
                ),
                child: Padding(
                  padding: EdgeInsets.all(0.5.h),
                  child: SvgPicture.asset(
                      'assets/icons/bookmarks/bookmark_fill_active.svg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
