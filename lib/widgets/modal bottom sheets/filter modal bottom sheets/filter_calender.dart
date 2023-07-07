import 'package:flutter/material.dart';
import 'package:monasba/providers/filter_provider.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/filter_back_button.dart';
import 'package:monasba/widgets/buttons/text%20buttons/ok_text_button.dart';
import 'package:monasba/widgets/calenders/cutom_table_calender.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FilterCalender extends StatefulWidget {
  const FilterCalender({super.key});

  @override
  State<FilterCalender> createState() => _FilterCalenderState();
}

class _FilterCalenderState extends State<FilterCalender> {
  DateTime? _selectedDate;

  @override
  void initState() {
    if (context.read<FilterProvider>().date != null) {
      _selectedDate = context.read<FilterProvider>().date;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.4.w),
      margin: EdgeInsets.symmetric(horizontal: 4.4.w, vertical: 1.9.h),
      height: 58.h,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterBackButton(),
          Flexible(
              child: CustomTableCalender(
            selectedDate: _selectedDate,
            onTap: (DateTime dateTime) {
              _selectedDate = dateTime;
            },
          )),
          OkTextButton(onPressed: () {
            context.read<FilterProvider>().setDate(_selectedDate);
          }),
        ],
      ),
    );
  }
}
