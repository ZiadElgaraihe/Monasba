import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/login_page.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/signup_page.dart';
import 'package:monasba/widgets/appbars/empty_appbar.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:sizer/sizer.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      appBar: const EmptyAppBar(pageMode: PageMode.dark),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to',
                style: TextStyle(
                  letterSpacing: 1.30.sp,
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              SvgPicture.asset(
                'assets/icons/logos/Monasba logo text.svg',
                width: 65.7.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 66.w,
                child: Text(
                  'Let\'s discover the best place for your occasion',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              ColoredButton(
                  title: 'Sign up',
                  pageMode: PageMode.dark,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, SignupPage.id);
                  }),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Already have an account',
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 11.sp,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginPage.id);
                },
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: const Color(0xFFED9526),
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
