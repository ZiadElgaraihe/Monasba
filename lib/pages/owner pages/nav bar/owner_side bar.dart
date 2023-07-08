import 'package:flutter/material.dart';
import 'package:monasba/pages/owner%20pages/reservation%20user/reservation_user_page.dart';
import 'package:monasba/pages/user%20pages/contact%20us%20pages/contact_us_page_one.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/login_page.dart';
import 'package:monasba/pages/user%20pages/sidebar%20pages/notification_page.dart';
import 'package:monasba/widgets/containers/side_bar_item.dart';
import 'package:monasba/widgets/nav%20bar/app_navbar.dart';
import 'package:sizer/sizer.dart';

class OwnerSideBar extends StatefulWidget {
  const OwnerSideBar({super.key});

  @override
  State<OwnerSideBar> createState() => _OwnerSideBarState();
}

class _OwnerSideBarState extends State<OwnerSideBar>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 750),
      reverseDuration: const Duration(milliseconds: 750),
      vsync: this,
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    ));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              animationController.reverse();
              Future.delayed(
                const Duration(milliseconds: 760),
                () {
                  Scaffold.of(context).closeDrawer();
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.9.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.4.w, vertical: 3.8.h),
              margin: EdgeInsets.only(left: 2.2.w, right: 15.6.w),
              decoration: BoxDecoration(
                color: const Color(0xb3e6e6e6).withOpacity(0.98),
                borderRadius: BorderRadius.circular(50),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 8.7.h,
                              width: 14.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF2b2b2b),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'N',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23.sp,
                                ),
                              ),
                            ),
                            Positioned.directional(
                              textDirection: TextDirection.ltr,
                              bottom: 0.25.h,
                              end: 0.25.w,
                              child: Container(
                                height: 2.h,
                                width: 3.1.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2ab930),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 1.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 2.8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  color: const Color(0xFF2d2d2d),
                                  fontSize: 16.sp),
                            ),
                            Text(
                              'active',
                              style: TextStyle(
                                  color: const Color(0xFF2ab930),
                                  fontSize: 9.sp),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 6.4.h),
                    SideBarItem(
                      title: 'Edit Place',
                      icon: 'assets/icons/sidebar icons/bell.svg',
                      hasNotifications: true,
                      onTap: () {
                        Navigator.pushNamed(context, NotificationPage.id);
                      },
                    ),
                    SideBarItem(
                      title: 'User Reservation',
                      icon: 'assets/icons/sidebar icons/calendar_duotone.svg',
                      hasNotifications: true,
                      onTap: () {
                        Navigator.pushNamed(context, ReservationUserPage.id);
                      },
                    ),
                    SideBarItem(
                      title: 'Contact us',
                      icon: 'assets/icons/sidebar icons/chat_fill.svg',
                      hasNotifications: false,
                      onTap: () {
                        Navigator.pushNamed(context, ContactUsPageOne.id);
                      },
                    ),
                    SideBarItem(
                      title: 'User Services',
                      icon: 'assets/icons/sidebar icons/Add_round_fill.svg',
                      hasNotifications: false,
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppNavBar.id, (route) => false);
                      },
                    ),
                    SizedBox(height: 16.4.h),
                    SideBarItem(
                      title: 'Log Out',
                      titleColor: Colors.black,
                      icon: 'assets/icons/sidebar icons/log_out.svg',
                      hasNotifications: false,
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginPage.id, (route) => false);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
