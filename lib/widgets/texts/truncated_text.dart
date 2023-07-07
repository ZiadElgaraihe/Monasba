import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TruncatedText extends StatelessWidget {
  const TruncatedText({
    super.key,
    required this.title,
  });

  final String title;

  String truncateText(String text, int maxWords) {
    List<String> words = text.split(' ');
    if (words.length <= maxWords) {
      return text;
    } else {
      return '${words.sublist(0, maxWords).join(' ')}...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      truncateText(title, 20),
      style: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
      ),
      maxLines: 5,
    );
  }
}
