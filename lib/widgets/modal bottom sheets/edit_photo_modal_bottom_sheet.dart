import 'package:flutter/material.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/bottom_sheet_inkwell.dart';
import 'package:sizer/sizer.dart';

class EditPhotoModalBottomSheet extends StatelessWidget {
  const EditPhotoModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.4.w),
      margin: EdgeInsets.symmetric(horizontal: 4.4.w, vertical: 2.5.h),
      height: 16.3.h,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          BottomSheetInkWell(
              title: 'Add Image',
              trailingIcon: 'assets/icons/bottom sheet icons/img_load_box.svg'),
          BottomSheetInkWell(
              title: 'Delete',
              trailingIcon: 'assets/icons/bottom sheet icons/trash.svg'),
        ],
      ),
    );
  }
}
