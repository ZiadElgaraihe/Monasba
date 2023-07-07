import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({super.key, required this.city, required this.country});

  final String city, country;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on, color: const Color(0xFF757575), size: 2.25.h),
        Text(
          '$city - $country',
          style: TextStyle(color: const Color(0xFF757575), fontSize: 11.sp),
        )
      ],
    );
  }
}
