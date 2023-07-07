// import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_svg/svg.dart';
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
  bool closedContainer = false;
  bool offerContainer = false;
  bool reserveContainer = false;
  bool hallOfferContainer = false;
  bool packageOfferContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDesign(pageMode: PageMode.light, title: 'Calender'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: (!closedContainer &&
              !offerContainer &&
              !reserveContainer &&
              !hallOfferContainer &&
              !packageOfferContainer)
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
                        closedContainer = true;
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
            closedContainer
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
                                    closedContainer = false;
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
                                    closedContainer = false;
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

  /********* Offer Container ***********/
        offerContainer
            ? Positioned(
                bottom: 11.h,
                left: 4.w,
                // right: ,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 1.3.h, bottom: 1.9.h, left: 4.5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  width: 91.w,
                  height: 42.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Offer",
                          style: TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              //fontFamily: "Manrope",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.sp),
                          textAlign: TextAlign.left),
                      const StartEndDate(startDate: "26-5-2023"),
                      /**ROW1 */
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Hallimage.svg',
                            width: 6.7.w,
                          ),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Hall',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            width: 56.w,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                hallOfferContainer = true;
                                offerContainer = false;
                              });
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: const Color(0xffffffff),
                              size: 5.w,
                            ),
                          ),
                        ],
                      ),
                      /**ROW2 */
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/PackageImage.svg',
                            width: 6.7.w,
                          ),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Package',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            width: 46.9.w,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                offerContainer = false;
                                packageOfferContainer = true;
                              });
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: const Color(0xffffffff),
                              size: 5.w,
                            ),
                          ),
                        ],
                      ),
                      /**ROW3 */
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/DisPerImage.svg',
                            width: 6.7.w,
                          ),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Discount Percentage',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                      /**LASTROW */
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  offerContainer = false;
                                });
                              },
                              child: Text("Cancel",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.sp))),
                          SizedBox(
                            width: 38.6.w,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text("Delete",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.sp))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  offerContainer = false;
                                });
                              },
                              child: Text("Save",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.sp))),
                        ],
                      )
                    ],
                  ),
                ),
              )
            : Container(),
        /********* Hall Offer Container *********/
        hallOfferContainer
            ? Positioned(
                bottom: 11.h,
                left: 4.w,
                // right: ,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 1.3.h, bottom: 1.9.h, left: 4.5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  width: 91.w,
                  height: 42.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            offerContainer = true;
                            hallOfferContainer = false;
                          });
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: const Color(0xffffffff),
                          size: 5.w,
                        ),
                      ),
                      /**ROW1 */
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Hallimage.svg',
                            width: 6.7.w,
                          ),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Hall Name',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                      /**ROW2 */
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Hallimage.svg',
                            width: 6.7.w,
                          ),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Hall Name',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                      /**ROW3 */
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Hallimage.svg',
                            width: 6.7.w,
                          ),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Hall Name',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                      /**ROW4 */
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Hallimage.svg',
                            width: 6.7.w,
                          ),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Hall Name',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          "Ok",
                          style:
                              TextStyle(color: Colors.white, fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        /********* Package Offer Container *********/
        packageOfferContainer
            ? Positioned(
                bottom: 11.h,
                left: 4.w,
                // right: ,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 1.3.h, bottom: 1.9.h, left: 4.5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  width: 91.w,
                  height: 42.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            offerContainer = true;
                            packageOfferContainer = false;
                          });
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: const Color(0xffffffff),
                          size: 5.w,
                        ),
                      ),
                      /**ROW1 */
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Hallimage.svg',
                            width: 6.7.w,
                          ),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Package Name',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                      /**ROW2 */
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Hallimage.svg',
                            width: 6.7.w,
                          ),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Package Name',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                      /**ROW3 */
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Hallimage.svg',
                            width: 6.7.w,
                          ),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Package Name',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                      /**ROW4 */
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Hallimage.svg',
                            width: 6.7.w,
                          ),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Package Name',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          "Ok",
                          style:
                              TextStyle(color: Colors.white, fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        reserveContainer
            ? Positioned(
                bottom: 11.h,
                left: 4.w,
                // right: ,
                child: Container(
                  padding: EdgeInsets.only(
                      top: 1.3.h, bottom: 1.9.h, left: 4.5.w, right: 6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  width: 91.w,
                  height: 28.5.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date",
                          style: TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              //fontFamily: "Manrope",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.sp),
                          textAlign: TextAlign.left),
                      StartEndDate(startDate: "10 jule"),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/ClockImage.svg',
                              width: 6.7.w),
                          SizedBox(
                            width: 2.7.w,
                          ),
                          Text(
                            'Select Time',
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Manrope",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            width: 39.4.w,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: const Color(0xffffffff),
                              size: 5.w,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  reserveContainer = false;
                                });
                              },
                              child: Text("Cancel",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.sp))),
                          TextButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.sp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
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
