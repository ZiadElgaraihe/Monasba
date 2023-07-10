import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/widgets/rows/location_row.dart';
import 'package:monasba/widgets/texts/place_name_text.dart';
import 'package:sizer/sizer.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.9.h, horizontal: 4.4.w),
      child: SizedBox(
        height: 8.8.h,
        child: Row(
          children: [
            SizedBox(
              width: 15.6.w,
              height: 8.8.h,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/hall 8.png'),
              ),
            ),
            SizedBox(width: 4.4.w),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlaceNameText(title: 'Name of Place'),
                LocationRow(city: 'City', country: 'Country'),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '09:11 -20/09/2021',
                style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.w500),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.topCenter,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(15),
                child: SvgPicture.asset(
                  'assets/icons/trash.svg',
                  width: 6.7.w,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
