import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalender extends StatefulWidget {
  const CustomTableCalender({
    super.key,
    this.selectedDate,
    required this.onTap,
  });

  final DateTime? selectedDate;
  final Function onTap;

  static String id = '/calender page';

  @override
  State<CustomTableCalender> createState() => _CustomTableCalenderState();
}

class _CustomTableCalenderState extends State<CustomTableCalender> {
  late PageController _pageController;
  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier<DateTime?>(null);

  @override
  void initState() {
    _selectedDate.value = widget.selectedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.4.w),
      child: ValueListenableBuilder(
        valueListenable: _selectedDate,
        builder: (context, value, child) => TableCalendar(
          onCalendarCreated: (pageController) {
            _pageController = pageController;
          },
          onDaySelected: (selectedDay, focusedDay) {
            widget.onTap(selectedDay);
            _selectedDate.value = selectedDay;
          },
          selectedDayPredicate: (day) => isSameDay(day, value),
          daysOfWeekHeight: 2.5.h,
          rowHeight: 5.h,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleTextFormatter: (date, locale) {
              return '${months[date.month - 1]} - ${date.year}';
            },
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            titleCentered: false,
            headerMargin: EdgeInsets.only(bottom: 1.3.h),
            leftChevronVisible: false,
            rightChevronPadding: EdgeInsets.zero,
            rightChevronIcon: Row(
              children: [
                InkWell(
                  onTap: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/trends/Left.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcATop),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/trends/Right.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcATop),
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFbdbdbd),
                ),
              ),
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.white, fontSize: 10.sp),
            weekendStyle: TextStyle(color: Colors.white, fontSize: 10.sp),
          ),
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            todayDecoration: const BoxDecoration(color: Colors.transparent),
            todayTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),

            // onselected event
            selectedDecoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),

            selectedTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
            defaultTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
            weekendTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
          startingDayOfWeek: StartingDayOfWeek.sunday,
          focusedDay: value ?? DateTime.now(),
          firstDay: DateTime(2000),
          lastDay: DateTime(2030),
        ),
      ),
    );
  }
}
