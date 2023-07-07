import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrivacyCheckbox extends StatefulWidget {
  const PrivacyCheckbox({super.key});

  @override
  State<PrivacyCheckbox> createState() => _PrivacyCheckboxState();
}

class _PrivacyCheckboxState extends State<PrivacyCheckbox> {
  ValueNotifier<bool> isAccepted = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: isAccepted,
          builder: (context, value, child) => Transform.scale(
            scale: 0.13.h,
            child: Checkbox(
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              fillColor: MaterialStatePropertyAll(
                  value ? const Color(0xFF95c0f9) : const Color(0xFF686868)),
              value: value,
              onChanged: (value) {
                isAccepted.value = !isAccepted.value;
              },
            ),
          ),
        ),
        SizedBox(width: 2.8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'I have read and agree with ',
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
                Text(
                  'Terms of Service',
                  style: TextStyle(
                      color: const Color(0xFF95c0f9), fontSize: 12.sp),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'and our ',
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
                Text(
                  'Privacy Polices',
                  style: TextStyle(
                      color: const Color(0xFF95c0f9), fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
