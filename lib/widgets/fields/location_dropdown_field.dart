import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/providers/location_dropdown_provider.dart';
import 'package:monasba/widgets/buttons/dropdown%20buttons/location_dropdown_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LocationDropdownField extends StatelessWidget {
  const LocationDropdownField(
      {super.key, required this.pageMode, required this.orientation});

  final PageMode pageMode;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.3.w), //left: 4.5.w,
          height: 5.5.h,
          width: orientation == Orientation.landscape ? 47.25.h : 45.25.w,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                  width: 1.w,
                  color:
                      pageMode == PageMode.dark ? Colors.white : Colors.black),
            ),
          ),
          child: Text(
            'Egypt',
            style: TextStyle(
                color: pageMode == PageMode.dark ? Colors.white : Colors.black,
                fontSize: 14.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.w), //left: 4.5.w,
          height: 5.6.h,
          width: orientation == Orientation.landscape ? 47.25.h : 45.25.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                  width: 1.w,
                  color:
                      pageMode == PageMode.dark ? Colors.white : Colors.black),
            ),
          ),
          child: Selector<LocationDropDownProvider, String?>(
            selector: (context, provider) => provider.selectedCity,
            builder: (context, value, child) {
              return DropdownButtonDesign(
                title: 'City',
                list: cities,
                value: value,
                onChanged: context.watch<LocationDropDownProvider>().changeCity,
                pageMode: pageMode,
                dropDownDataWidth:
                    orientation == Orientation.landscape ? 46.5.h : 44.5.w,
              );
            },
          ),
        ),
      ],
    );
  }
}
