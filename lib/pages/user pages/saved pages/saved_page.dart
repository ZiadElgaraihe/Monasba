import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/pages/user%20pages/place%20pages/place_page.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/cards/place_card.dart';
import 'package:sizer/sizer.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: const AppBarDesign(pageMode: PageMode.light, title: 'Saved'),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(top: 3.8.h, left: 4.4.w, right: 4.4.w),
          child: PlaceCard(
              asset: 'assets/icons/Close_round.svg',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlacePage(
                          title: 'Name of Place',
                          image: 'assets/images/hall 1.png',
                          address: 'Port Said',
                          rate: '5.0'),
                    ));
              }),
        ),
      ),
    );
  }
}
