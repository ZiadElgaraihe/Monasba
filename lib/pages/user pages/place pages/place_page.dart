import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/pages/user%20pages/place%20pages/hall_page.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/rows/rate_row.dart';
import 'package:monasba/widgets/stacks/place_stack.dart';
import 'package:monasba/widgets/texts/page_definition.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: const AppBarDesign(pageMode: PageMode.light),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.4.w),
          child: Column(
            children: [
              SizedBox(height: 3.8.h),
              Row(
                children: [
                  Container(
                    width: 22.2.w,
                    height: 12.5.h,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(width: 2.2.h),
                  SizedBox(
                    width: 62.5.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PageTitle(
                            title: title, pageMode: PageMode.light),
                        SizedBox(height: 1.3.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const PageDefinition(
                                title: 'Address', pageMode: PageMode.light),
                            RateRow(
                                rate: '4.5',
                                fontSize: 14.sp,
                                iconHeight: 2.5.h),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.8.h),
              Text(
                'Lorem ipsum dolor sit amet consectetur. '
                'Volutpat sed sem tellus tellus quisque. Blandit praesent '
                'fusce vulputate nulla egestas ultrices diam. Lectus nulla '
                'ipsum turpis sed enim eu nibh amet sed.',
                style: TextStyle(fontSize: 13.sp),
              ),
              SizedBox(height: 3.8.h),
              PlaceStack(
                  title: 'Hall Name',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const HallPage(title: 'Hall Page'),
                        ));
                  }),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
