import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/pages/user%20pages/place%20pages/hall_page.dart';
import 'package:monasba/widgets/rows/location_row.dart';
import 'package:monasba/widgets/rows/rate_row.dart';
import 'package:monasba/widgets/texts/place_name_text.dart';
import 'package:sizer/sizer.dart';

class HallStack extends StatelessWidget {
  const HallStack({super.key, this.orientation});

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
      itemCount: halls.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HallPage(title: halls[index]['hall name']!, rate: halls[index]['rate']!),
              ));
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
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(halls[index]['img']!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 1.3.h),
                PlaceNameText(title: halls[index]['hall name']!),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LocationRow(city: halls[index]['city']!),
                    const Spacer(),
                    RateRow(
                        rate: halls[index]['rate']!,
                        iconHeight: 1.9.h,
                        fontSize: 10.sp),
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
