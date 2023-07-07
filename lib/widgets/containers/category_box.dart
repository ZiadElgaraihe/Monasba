import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    Key? key,
    required this.title,
    required this.selectedOccasions,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final String title;
  final List<String> selectedOccasions;
  final Function onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.1.w, vertical: 0.6.h),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.9.h, horizontal: 3.3.w),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFed9526) : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              if (isSelected) SizedBox(width: 1.7.w),
              if (isSelected) SvgPicture.asset('assets/icons/done.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
