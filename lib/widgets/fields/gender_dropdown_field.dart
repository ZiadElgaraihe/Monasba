import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/providers/gender_dropdown_provider.dart';
import 'package:monasba/widgets/buttons/dropdown%20buttons/location_dropdown_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class GenderDropDownField extends StatelessWidget {
  const GenderDropDownField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5.w), //left: 4.5.w,
      height: 5.5.h,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 1.w, color: Colors.black),
        ),
      ),
      child: Selector<GenderDropDownProvider, String?>(
        selector: (context, provider) => provider.gender,
        builder: (context, value, child) => DropdownButtonDesign(
            title: 'None',
            list: genders,
            value: value,
            onChanged: (value) {
              context.read<GenderDropDownProvider>().gender = value;
            },
            pageMode: PageMode.light,
            dropDownDataWidth: 85.w),
      ),
    );
  }
}
