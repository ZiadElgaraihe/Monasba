import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/pages/user%20pages/welcome%20pages/welcome_page.dart';
import 'package:monasba/widgets/appbars/empty_appbar.dart';
import 'package:sizer/sizer.dart';
import 'package:page_transition/page_transition.dart';

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(pageMode: PageMode.dark),
      body: AnimatedSplashScreen(
        splash: Center(
          child: Text(
            'Welcome',
            style: TextStyle(
              letterSpacing: 1.30.sp,
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: darkBackground,
        nextScreen: const WelcomePage(),
        duration: 1250,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}
