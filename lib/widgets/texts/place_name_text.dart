import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlaceNameText extends StatelessWidget {
  const PlaceNameText({super.key, required this.title});

  final String title;

  String truncateText(String text, int maxCharacters) {
    if (text.length <= maxCharacters) {
      return text;
    } else {
      return '${text.split('').sublist(0, maxCharacters).join('')}...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(truncateText(title, 17),
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold));
  }
}
