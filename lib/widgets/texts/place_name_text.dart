import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlaceNameText extends StatelessWidget {
  const PlaceNameText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold));
  }
}
