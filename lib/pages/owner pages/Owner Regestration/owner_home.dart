import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/stacks/hall_stack.dart';
import 'package:sizer/sizer.dart';
import '../../../widgets/rows/rate_row.dart';
import '../../../widgets/texts/page_definition.dart';
import '../../../widgets/texts/page_title.dart';

class OwnerHome extends StatelessWidget {
  static String id = '/Owner Home';

  const OwnerHome({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/icons/owner page/Outer_side_bar.svg',
              height: 3.8.h,
            ),
          );
        }),
        systemOverlayStyle:
            SystemUiOverlayStyle.dark.copyWith(statusBarColor: lightBackground),
      ),
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
                        const PageTitle(
                            title: 'Place Name', pageMode: PageMode.light),
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
                "Lorem ipsum dolor sit amet consectetur. "
                "Volutpat sed sem tellus tellus quisque. Blandit"
                "praesent fusce vulputate nulla egestas ultrices"
                " diam. Lectus nulla ipsum turpis sed enim eu "
                "nibh amet sed.",
                style: TextStyle(fontSize: 13.sp),
              ),
              SizedBox(height: 3.8.h),
              const HallStack(),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
