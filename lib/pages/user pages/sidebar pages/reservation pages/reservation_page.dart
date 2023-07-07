import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/dropdown%20buttons/reservation_dropdown.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  static String id = '/reservation page';

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        backgroundColor: lightBackground,
        appBar: const AppBarDesign(
          pageMode: PageMode.light,
          title: 'Reservation',
        ),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) =>
              ReservationDropDown(orientaion: orientation),
        ),
      ),
    );
  }
}
