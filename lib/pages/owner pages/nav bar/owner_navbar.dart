import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/pages/user%20pages/profile%20pages/profile.dart';
import 'package:monasba/pages/owner%20pages/calender/ownercalender.dart';
import 'package:monasba/pages/owner%20pages/nav%20bar/owner_side%20bar.dart';
import 'package:monasba/pages/owner%20pages/review%20pages/owner_review.dart';
import 'package:sizer/sizer.dart';

import '../Owner Regestration/owner_home.dart';

class OwnerAppNavBar extends StatefulWidget {
  const OwnerAppNavBar({super.key});

  static String id = '/Owner app navbar';

  @override
  State<OwnerAppNavBar> createState() => _OwnerAppNavBarState();
}

class _OwnerAppNavBarState extends State<OwnerAppNavBar> {
  int slctIndx = 0;
  GlobalKey<ScaffoldState> ownerBarkey = GlobalKey<ScaffoldState>();
  late List<Widget> navBarPages;
  @override
  void initState() {
    navBarPages = [
      OwnerHome(scaffoldKey: ownerBarkey),
      const OwnerCalender(),
      const OwnerReviewPage(),
      const Profile(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ownerBarkey,
      extendBody: true, // appear the content under the clipped part
      bottomNavigationBar: ClipPath(
        clipper: Clipper(),
        child: Container(
          color: Colors.black,
          alignment: Alignment.bottomCenter,
          height: 14.7.h,
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            currentIndex: slctIndx,
            onTap: (index) {
              setState(() {
                slctIndx = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: '',
                  icon: SvgPicture.asset(
                      'assets/icons/navbar icons/home/home.svg',
                      height: 4.h),
                  activeIcon: SvgPicture.asset(
                      'assets/icons/navbar icons/home/home_active.svg',
                      height: 6.h)),
              BottomNavigationBarItem(
                  label: '',
                  icon: SvgPicture.asset(
                      'assets/icons/owner page/nav_bar_calendar.svg',
                      height: 4.h),
                  activeIcon: SvgPicture.asset(
                      'assets/icons/owner page/nav_bar_calender_active.svg',
                      height: 6.h)),
              BottomNavigationBarItem(
                  label: '',
                  icon: SvgPicture.asset('assets/icons/owner page/review.svg',
                      height: 4.h),
                  activeIcon: SvgPicture.asset(
                      'assets/icons/owner page/review_active.svg',
                      height: 6.h)),
              BottomNavigationBarItem(
                  label: '',
                  icon: SvgPicture.asset(
                      'assets/icons/navbar icons/profile/user_profile.svg',
                      height: 4.h),
                  activeIcon: SvgPicture.asset(
                      'assets/icons/navbar icons/profile/user_profile_active.svg',
                      height: 6.h)),
            ],
          ),
        ),
      ),
      body: navBarPages.elementAt(slctIndx),
      drawer: const OwnerSideBar(),
      drawerScrimColor: Colors.transparent,
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.quadraticBezierTo(w - 5, h / 4, w - 30, h / 3.5);
    path.lineTo(30, h / 3.5);
    path.quadraticBezierTo(5, h / 4, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
