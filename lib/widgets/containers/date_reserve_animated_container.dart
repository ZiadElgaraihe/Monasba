import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/widgets/containers/time_picker_container.dart';
import 'package:monasba/widgets/rows/date_animated_container_item.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class DateReserveAnimatedContainer extends StatelessWidget {
  const DateReserveAnimatedContainer({super.key, required this.isVisible});

  final ValueNotifier<bool> isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
      width: 91.1.w,
      height: isVisible.value ? 28.4.h : 0.h,
      padding: EdgeInsets.symmetric(
        vertical: 1.3.h,
        horizontal: 4.4.w,
      ),
      decoration: BoxDecoration(
        color: darkBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(
              title: 'Date',
              pageMode: PageMode.dark,
              fontSize: 16.sp,
            ),
            SizedBox(height: 1.8.h),
            DateAnimatedContainerItem(
              icon: Icons.calendar_month_rounded,
              title: 'Day',
              value: context.watch<ReservationCubit>().day,
            ),
            SizedBox(height: 1.3.h),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  handleTimePicker(context);
                },
                child: DateAnimatedContainerItem(
                  icon: Icons.access_time,
                  title: 'Time',
                  value: context
                      .watch<ReservationCubit>()
                      .time
                      ?.format(context)
                      .toString(),
                ),
              ),
            ),
            SizedBox(height: 1.8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    isVisible.value = false;
                  },
                  child: PageTitle(
                    title: 'Close',
                    pageMode: PageMode.dark,
                    fontSize: 12.sp,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: PageTitle(
                    title: 'Continue',
                    pageMode: PageMode.dark,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void handleTimePicker(context) async {
    TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      useRootNavigator: false,
      initialTime: BlocProvider.of<ReservationCubit>(context).time ??
          const TimeOfDay(hour: 00, minute: 00),
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (BuildContext context, Widget? child) {
        return TimePickerContainer(child: child!);
      },
    );
    if (timeOfDay != null) {
      BlocProvider.of<ReservationCubit>(context).selectTime(timeOfDay);
    }
  }
}
