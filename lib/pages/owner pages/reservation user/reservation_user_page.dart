import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/dropdown%20buttons/User_reservation_dropdown.dart';
import 'package:sizer/sizer.dart';

class ReservationUserPage extends StatelessWidget {
  const ReservationUserPage({super.key});

  static String id = '/reservation page';

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        backgroundColor: lightBackground,
        appBar: const AppBarDesign(
          pageMode: PageMode.light,
          title: 'User Reservation',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  fixedSize: MaterialStatePropertyAll(Size(8.8.w, 5.h))),
              onPressed: () {},
              child: SvgPicture.asset(
                "assets/icons/UserFilter.svg",
                height: 4.h,
                width: 10.w,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) =>
                    UserReservationDropDown(orientaion: orientation),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
