import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/cards/history_item.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  static String id = '/history page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: const AppBarDesign(pageMode: PageMode.light, title: 'History'),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const HistoryItem(),
      ),
    );
  }
}
