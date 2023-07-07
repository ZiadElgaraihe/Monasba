import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/cards/review_item.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  static String id = '/review page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: const AppBarDesign(pageMode: PageMode.light, title: 'Review'),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const ReviewItem(),
      ),
    );
  }
}
