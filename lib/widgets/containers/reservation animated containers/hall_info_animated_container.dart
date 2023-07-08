import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/widgets/rows/animated_container_buttons.dart';
import 'package:monasba/widgets/rows/date_animated_container_item.dart';
import 'package:monasba/widgets/rows/package_info_item.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HallInfoAnimatedContainer extends StatelessWidget {
  const HallInfoAnimatedContainer(
      {super.key,
      required this.isVisible,
      required this.onBackPressed,
      required this.onContinuePressed});

  final ValueNotifier<bool> isVisible;
  final Function onBackPressed, onContinuePressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: isVisible.value ? 35.h : 0.h,
      width: 91.1.w,
      padding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 4.4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: darkBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PageTitle(
              title: 'Hall Info',
              pageMode: PageMode.dark,
              fontSize: 16.sp,
            ),
            SizedBox(height: 1.8.h),
            const ReservationItem(
              icon: 'assets/icons/reservation icons/hall.svg',
              title: '',
              value: 'Hall Name',
              pageMode: PageMode.dark,
            ),
            SizedBox(height: 1.3.h),
            const ReservationItem(
              icon: 'assets/icons/reservation icons/package.svg',
              title: '',
              value: 'Package Name',
              pageMode: PageMode.dark,
            ),
            SizedBox(height: 1.8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PackageInfoItem(
                    value: context.read<ReservationCubit>().numberOfPersons ??
                        'N/A',
                    title: 'Person',
                    color: Colors.white),
                PackageInfoItem(
                    value: context.read<ReservationCubit>().price ?? 'N/A',
                    title: 'EGP',
                    color: Colors.white,),
              ],
            ),
            SizedBox(height: 2.5.h),
            AnimatedContainerButtons(
              onClosePressed: () {
                isVisible.value = false;
              },
              onBackPressed: onBackPressed,
              onContinuePressed: onContinuePressed,
            ),
          ],
        ),
      ),
    );
  }
}
