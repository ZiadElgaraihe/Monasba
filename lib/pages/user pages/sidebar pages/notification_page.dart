import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/cards/notification_item.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static String id = '/notification page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar:
          const AppBarDesign(pageMode: PageMode.light, title: 'Notification'),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const NotificationItem(),
      ),
    );
  }
}
