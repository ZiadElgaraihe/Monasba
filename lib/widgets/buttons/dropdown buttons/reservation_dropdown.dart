import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/pages/user%20pages/sidebar%20pages/reservation%20pages/reservation_information_page.dart';
import 'package:sizer/sizer.dart';

class ReservationDropDown extends StatefulWidget {
  const ReservationDropDown({super.key, required this.orientaion});

  final Orientation orientaion;

  @override
  State<ReservationDropDown> createState() => _ReservationDropDownState();
}

class _ReservationDropDownState extends State<ReservationDropDown> {
  ValueNotifier<bool> isDropped = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDropped,
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.4.w),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                isDropped.value = !isDropped.value;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'dd/mm/yyyy',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(
                    value
                        ? 'assets/icons/trends/Bottom.svg'
                        : 'assets/icons/trends/Left.svg',
                    height: 3.4.h,
                    width: 6.1.w,
                  )
                ],
              ),
            ),
            SizedBox(height: 1.3.h),
            value
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 6.7.w,
                      mainAxisSpacing: 2.5.h,
                      crossAxisCount:
                          widget.orientaion == Orientation.landscape ? 3 : 2,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ReservationInformationPage.id);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 1.9.w),
                        height: 22.8.h,
                        width: 39.2.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 15.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/Rectangle 4233.png'),
                                ),
                              ),
                            ),
                            SizedBox(height: 0.6.h),
                            Text(
                              'Elzifaf',
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 0.6.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hall',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: const Color(0xFF686868),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '09:11 -20/09/2021',
                                  style: TextStyle(
                                      fontSize: 7.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(height: 1.3.h),
          ],
        ),
      ),
    );
  }
}
