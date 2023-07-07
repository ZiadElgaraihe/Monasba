import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/pages/user%20pages/profile%20pages/edit_profile.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/fields/textformfields/profile_data_text_form_field.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  static String id = '/Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: AppBarDesign(
        pageMode: PageMode.light,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProfile.id);
            },
            child: Text(
              'Edit',
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.4.w),
            child: Column(
              children: [
                const SizedBox(height: 3.8),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 35.6.w,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Image.asset('assets/images/Ellipse 3.png'),
                        ),
                      ),
                      SizedBox(height: 1.3.h),
                      Text('Mohamed Elden',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500)),
                      SizedBox(height: 0.6.h),
                      Text('PortSaid - Egypt',
                          style: TextStyle(
                              color: const Color(0xFF757575), fontSize: 14.sp)),
                    ],
                  ),
                ),
                SizedBox(height: 6.7.h),
                //will need a controller to change this fields
                const ProfileDataTextFormField(
                    label: 'Username', initValue: 'Mohamed'),
                SizedBox(height: 4.2.h),
                const ProfileDataTextFormField(
                    label: 'Full Name', initValue: 'Mohamed Ahmed Alaa Elden'),
                SizedBox(height: 4.2.h),
                const ProfileDataTextFormField(
                    label: 'E-mail', initValue: 'mohamedelden15@gmail.com'),
                SizedBox(height: 4.2.h),
                const ProfileDataTextFormField(
                    label: 'Gender', initValue: 'Male'),
                SizedBox(height: 4.2.h),
                const ProfileDataTextFormField(
                    label: 'Phone Number', initValue: '+201211898664'),
                SizedBox(height: 5.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
