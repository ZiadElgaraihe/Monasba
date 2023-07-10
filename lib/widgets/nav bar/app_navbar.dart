import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/pages/user%20pages/home%20pages/home_page.dart';
import 'package:monasba/pages/user%20pages/map%20pages/map_page.dart';
import 'package:monasba/pages/user%20pages/saved%20pages/saved_page.dart';
import 'package:monasba/widgets/containers/side_bar.dart';
import 'package:sizer/sizer.dart';

import '../../pages/user pages/profile pages/profile.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  static String id = '/app navbar';

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  late List<Widget> navBarPages;

  @override
  void initState() {
    super.initState();
    navBarPages = [
      SizedBox(
          height: 90.h,
          child: HomePage(
            navBarScaffoldKey: _key,
          )),
      SizedBox(height: 90.h, child: const MapPage()),
      SizedBox(height: 90.h, child: const SavedPage()),
      SizedBox(height: 90.h, child: const Profile()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentIndex,
      builder: (context, value, child) => Scaffold(
        key: _key,
        drawerScrimColor: Colors.transparent,
        drawer: const SideBar(),
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
              currentIndex: value,
              onTap: (value) {
                currentIndex.value = value;
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
                        'assets/icons/navbar icons/map/map.svg',
                        height: 4.h),
                    activeIcon: SvgPicture.asset(
                        'assets/icons/navbar icons/map/map_active.svg',
                        height: 6.h)),
                BottomNavigationBarItem(
                    label: '',
                    icon: SvgPicture.asset(
                        'assets/icons/navbar icons/saved/saved.svg',
                        height: 4.h),
                    activeIcon: SvgPicture.asset(
                        'assets/icons/navbar icons/saved/saved_active.svg',
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
        body: navBarPages.elementAt(currentIndex.value),
      ),
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
