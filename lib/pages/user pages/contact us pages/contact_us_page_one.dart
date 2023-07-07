import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/pages/user%20pages/contact%20us%20pages/contact_us_page_two.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:sizer/sizer.dart';

class ContactUsPageOne extends StatelessWidget {
  const ContactUsPageOne({super.key});

  static String id = '/page one';

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        backgroundColor: lightBackground,
        appBar:
            const AppBarDesign(title: 'Contact us', pageMode: PageMode.light),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                    height:
                        orientation == Orientation.landscape ? 24.5.w : 24.5.h),
                Container(
                  height: 18.1.h,
                  width: 32.2.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Icon(
                    Icons.mail,
                    color: Colors.white,
                    size: 18.w,
                  ),
                ),
                SizedBox(height: 3.8.h),
                Text(
                  'If you have any question',
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 19.7.h),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ContactUsPageTwo.id);
                  },
                  style: ButtonStyle(
                    overlayColor: const MaterialStatePropertyAll(Colors.grey),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.black),
                    fixedSize: MaterialStatePropertyAll(Size(75.w, 7.2.h)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Contact us',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                    trailing: SvgPicture.asset(
                      'assets/icons/trends/Left.svg',
                      height: 4.h,
                      colorFilter: const ColorFilter.mode(
                          Colors.white, BlendMode.srcATop),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
