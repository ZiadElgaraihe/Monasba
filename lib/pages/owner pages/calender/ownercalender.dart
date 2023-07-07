// import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/calenders/date_picker_calender.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class OwnerCalender extends StatefulWidget {
  const OwnerCalender({Key? key}) : super(key: key);

  static String id = '/Owner Calender';

  @override
  State<OwnerCalender> createState() => _OwnerCalenderState();
}

class _OwnerCalenderState extends State<OwnerCalender> {
  List<DateTime> selectedDates = [];
  ValueNotifier<DateTime> currentDateTime =
      ValueNotifier<DateTime>(DateTime.now());
  bool showContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDesign(pageMode: PageMode.light, title: 'Calender'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: (!showContainer)
          ? ExpandableFab(
              closeButtonStyle: const ExpandableFabCloseButtonStyle(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: Icon(Icons.arrow_forward_ios_outlined),
              ),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              distance: 18.w,
              expandedFabSize: ExpandableFabSize.regular,
              type: ExpandableFabType.left,
              children: [
                ExpandleFabItem(
                    icon: Icons.lock,
                    text: "Closed",
                    onPressed: () {
                      setState(() {
                        showContainer = true;
                      });
                    }),
                ExpandleFabItem(
                    icon: Icons.lock_open, text: "Open", onPressed: () {}),
                ExpandleFabItem(
                    icon: Icons.calendar_month_rounded,
                    text: "Reserve",
                    onPressed: () {}),
                ExpandleFabItem(
                    icon: Icons.local_offer, text: "Offer", onPressed: () {}),
              ],
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ******calender *********
            Padding(
              padding: EdgeInsets.only(top: 3.8.h),
              child: DatePickerCalender(
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs
                    dateRangePickerSelectionChangedArgs) {},
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            //******* container *********
            showContainer
                ? Container(
                    padding:
                        EdgeInsets.only(top: 1.3.h, bottom: 1.9.h, left: 4.5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    width: 91.w,
                    height: 22.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Closed",
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                //fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.sp),
                            textAlign: TextAlign.left),
                        const StartEndDate(startDate: "26-5-2023"),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    showContainer = false;
                                  });
                                },
                                child: const Text("Cancel",
                                    style: TextStyle(color: Colors.white))),
                            const SizedBox(
                              width: 60,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text("Delete",
                                    style: TextStyle(color: Colors.white))),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    showContainer = false;
                                  });
                                },
                                child: const Text("Save",
                                    style: TextStyle(color: Colors.white))),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(),
            SizedBox(
              height: 11.h,
            ),
          ],
        ),
      ),
    );
  }
}

class StartEndDate extends StatelessWidget {
  const StartEndDate({
    super.key,
    required this.startDate,
    this.endDate,
  });
  final String startDate;
  final String? endDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_month,
          color: Colors.grey,
          size: 6.7.w,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            startDate,
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        ),
        SizedBox(
          width: 8.9.w,
        ),
        Icon(
          Icons.calendar_month,
          color: Colors.grey,
          size: 6.7.w,
        ),
        TextButton(
            onPressed: () {},
            child: Text(endDate ?? "",
                style: TextStyle(color: Colors.white, fontSize: 14.sp))),
      ],
    );
  }
}

class ExpandleFabItem extends StatelessWidget {
  const ExpandleFabItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
  final String text;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 13.3.w,
      height: 7.5.h,
      child: FloatingActionButton.small(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: Colors.black,
        heroTag: null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(
              text,
              style: TextStyle(fontSize: 8.sp),
            )
          ],
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
