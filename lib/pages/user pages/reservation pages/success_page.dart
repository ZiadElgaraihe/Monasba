import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/empty_appbar.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/nav%20bar/app_navbar.dart';
import 'package:sizer/sizer.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  static String id = '/success page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: const EmptyAppBar(pageMode: PageMode.light),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.6.w),
          child: Column(
            children: [
              SizedBox(height: 22.7.h),
              SvgPicture.asset(
                'assets/icons/reservation icons/completed_successfully.svg',
                height: 30.2.h,
                width: 52.8.w,
              ),
              SizedBox(height: 5.h),
              Text(
                'Completed Successfully',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(height: 2.5.h),
              Text(
                'Thank you for trusting in your application and hope you have a great occasion',
                style:
                    TextStyle(fontSize: 12.sp, color: const Color(0xFF686868)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.6.h),
              ColoredButton(
                title: 'Back To Home',
                pageMode: PageMode.light,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppNavBar.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
