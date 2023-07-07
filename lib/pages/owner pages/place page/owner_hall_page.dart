import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/rows/details_row.dart';
import 'package:monasba/widgets/rows/rate_row.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

import 'owner_package_page.dart';

class OwnerHallPage extends StatelessWidget {
  const OwnerHallPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: lightBackground,
        appBar: AppBarDesign(pageMode: PageMode.light, title: title,actions: [TextButton(
            onPressed: () {
            //  Navigator.pushNamed(context, .id);
            },
            child: Text(
              'Edit',
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
            ),
          ),]),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.3.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 2.2.w, right: 1.7.w),
                      height: 1.7.h,
                      width: 3.1.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF2ab930)),
                    ),
                    Text(
                      'Open',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 2.5.h),
                Container(
                  width: double.infinity,
                  height: 33.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                ),
                SizedBox(height: 1.3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) => Container(
                      width: 20.w,
                      height: 11.3.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 2.8.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 74.7.w,
                      child: Text(
                        'Building 30, Grand city compound, Port said.',
                        style: TextStyle(
                            fontSize: 14.sp, color: const Color(0xFF686868)),
                      ),
                    ),
                    const Spacer(),
                    RateRow(rate: '4.5', fontSize: 14.sp, iconHeight: 2.5.h),
                  ],
                ),
                SizedBox(height: 2.8.h),
                Row(
                  children: List.generate(
                    3,
                    (index) => Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.4.h, horizontal: 4.4.w),
                      margin: EdgeInsets.only(right: 2.5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFFed9526)),
                      child: Text(
                        'Wedding',
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.8.h),
                PageTitle(
                    title: 'Details',
                    pageMode: PageMode.light,
                    fontSize: 16.sp),
                SizedBox(height: 1.1.h),
                const DetailsRow(title: 'Square', detail: '700m*600m'),
                SizedBox(height: 1.1.h),
                const DetailsRow(title: 'Max of persons', detail: '250-500'),
                SizedBox(height: 2.8.h),
                PageTitle(
                  title: 'Description',
                  pageMode: PageMode.light,
                  fontSize: 16.sp,
                ),
                SizedBox(height: 1.1.h),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Dui vitae '
                  'fermentum faucibus lacinia arcu est feugiat venenatis. In '
                  'pellentesque sociis accumsan consequat pharetra mi tempus amet.'
                  ' Vitae curabitur lectus cras lacus elementum.',
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xFF686868)),
                ),
                SizedBox(height: 2.8.h),
                ColoredButton(
                  title: 'See Our Package',
                  pageMode: PageMode.light,
                  buttonRaduis: 20,
                  width: 91.1.w,
                  height: 9.2.h,
                  fontSize: 18.sp,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OwnerPackagePage(),
                      ),
                    );
                  },
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
