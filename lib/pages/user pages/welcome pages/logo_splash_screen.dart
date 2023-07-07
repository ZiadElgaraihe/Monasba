import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/pages/user%20pages/welcome%20pages/second_splash_screen.dart';
import 'package:monasba/widgets/appbars/empty_appbar.dart';
import 'package:sizer/sizer.dart';

class LogoSplashScreen extends StatelessWidget {
  const LogoSplashScreen({super.key});

  static String id = '/logo splash screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(pageMode: PageMode.dark),
      body: AnimatedSplashScreen(
        splash: Center(
          child: Image.asset(
            'assets/images/monasba_logo_text.png',
            // height: 3.5.h,
            width: 65.7.w,
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: darkBackground,
        nextScreen: const SecondSplashScreen(),
        duration: 1000,
      ),
    );
  }
}
