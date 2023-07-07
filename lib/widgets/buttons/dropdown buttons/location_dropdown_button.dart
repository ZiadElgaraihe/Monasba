import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class DropdownButtonDesign extends StatefulWidget {
  const DropdownButtonDesign({
    super.key,
    required this.title,
    required this.list,
    this.value,
    required this.onChanged,
    required this.pageMode,
    required this.dropDownDataWidth,
  });

  final List<String> list;
  final Function onChanged;
  final String title;
  final String? value;
  final PageMode pageMode;
  final double dropDownDataWidth;

  @override
  State<DropdownButtonDesign> createState() => _DropdownButtonDesignState();
}

class _DropdownButtonDesignState extends State<DropdownButtonDesign> {
  final ValueNotifier<bool> _isOpened = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        menuItemStyleData: MenuItemStyleData(height: 5.6.h),
        dropdownStyleData: DropdownStyleData(
          width: widget.dropDownDataWidth,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(7.5)),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: ValueListenableBuilder(
            valueListenable: _isOpened,
            builder: (context, value, child) => SvgPicture.asset(
              value
                  ? 'assets/icons/trends/Bottom.svg'
                  : 'assets/icons/trends/Left.svg',
              height: 3.8.h,
              width: 6.7.w,
              colorFilter: ColorFilter.mode(
                  widget.pageMode == PageMode.dark
                      ? Colors.white
                      : Colors.black,
                  BlendMode.srcATop),
            ),
          ),
        ),
        isExpanded: true,
        hint: Padding(
          padding: EdgeInsets.only(left: 3.5.w),
          child: Text(
            widget.title,
            style: TextStyle(
                color: widget.pageMode == PageMode.dark
                    ? Colors.white
                    : Colors.black,
                fontSize: 14.sp),
          ),
        ),
        selectedItemBuilder: (context) {
          return widget.list.map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem(
                value: item,
                child: Padding(
                  padding: EdgeInsets.only(left: 3.5.w),
                  child: Text(item,
                      style: TextStyle(
                          color: widget.pageMode == PageMode.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 14.sp)),
                ));
          }).toList();
        },
        onMenuStateChange: (isOpen) {
          _isOpened.value = isOpen;
        },
        items: widget.list
            .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          widget.onChanged(value);
        },
        value: widget.value,
      ),
    );
  }
}
