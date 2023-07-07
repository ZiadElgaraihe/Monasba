import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerCalender extends StatelessWidget {
  const DatePickerCalender(
      {super.key,
      this.blackoutDates,
      this.specialDates,
      required this.selectionMode,
      required this.onSelectionChanged});

  final List<DateTime>? blackoutDates, specialDates;
  final DateRangePickerSelectionMode selectionMode;
  final void Function(DateRangePickerSelectionChangedArgs) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 43.9.h,
        width: 88.9.w,
        child: SfDateRangePicker(
          headerStyle: DateRangePickerHeaderStyle(
            textStyle: TextStyle(
                color: Colors.orange,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
          headerHeight: 7.5.h,
          selectionMode: selectionMode,
          startRangeSelectionColor: Colors.orange,
          endRangeSelectionColor: Colors.orange,
          monthCellStyle: DateRangePickerMonthCellStyle(
            textStyle: TextStyle(fontSize: 16.sp),
            disabledDatesTextStyle:
                TextStyle(color: Colors.grey, fontSize: 16.sp),
            blackoutDateTextStyle:
                TextStyle(color: Colors.grey, fontSize: 16.sp),
            specialDatesDecoration: const BoxDecoration(
                color: Color(0xFFdfdfdf), shape: BoxShape.circle),
            specialDatesTextStyle:
                TextStyle(fontSize: 16.sp, color: const Color(0xFFed9526)),
            todayCellDecoration: const BoxDecoration(),
            todayTextStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          ),
          selectionTextStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
          rangeSelectionColor: Colors.orange,
          selectionColor: Colors.orange,
          rangeTextStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
          minDate: DateTime.now(),
          monthFormat: 'MMM -',
          monthViewSettings: DateRangePickerMonthViewSettings(
            dayFormat: 'EEE',
            enableSwipeSelection: false,
            blackoutDates: blackoutDates,
            specialDates: specialDates,
          ),
          showNavigationArrow: true,
          onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
            onSelectionChanged(dateRangePickerSelectionChangedArgs);
          },
        ),
      ),
    );
  }
}
