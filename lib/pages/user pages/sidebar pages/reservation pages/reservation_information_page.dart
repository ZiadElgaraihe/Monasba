import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/fields/textformfields/profile_data_text_form_field.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class ReservationInformationPage extends StatelessWidget {
  const ReservationInformationPage({super.key});

  static String id = '/reservation information page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar:
          const AppBarDesign(pageMode: PageMode.light, title: 'Reservation'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.4.w),
          child: Column(
            children: [
              SizedBox(height: 3.8.h),
              PageTitle(
                title: 'Collection of  Hall Name',
                pageMode: PageMode.light,
                fontSize: 18.sp,
              ),
              SizedBox(height: 3.8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageTitle(
                    title: 'Information',
                    pageMode: PageMode.light,
                    fontSize: 16.sp,
                  ),
                ],
              ),
              SizedBox(height: 3.8.h),
              const ProfileDataTextFormField(
                label: 'Barrier Name',
                initValue: 'Khaled Ali Elsayed Noor',
              ),
              SizedBox(height: 3.8.h),
              const ProfileDataTextFormField(
                label: 'Guarantor Name',
                initValue: 'Kareem Mohamed Sharaf Eldin',
              ),
              SizedBox(height: 3.8.h),
              const ProfileDataTextFormField(
                label: 'Phone Number',
                initValue: '+201209903403',
              ),
              SizedBox(height: 3.8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageTitle(
                    title: 'Details',
                    pageMode: PageMode.light,
                    fontSize: 16.sp,
                  ),
                ],
              ),
              SizedBox(height: 3.8.h),
              const ProfileDataTextFormField(
                label: 'Address',
                initValue: 'Region  - Port said   -  Egypt',
              ),
              SizedBox(height: 3.8.h),
              const ProfileDataTextFormField(
                label: 'Occasion',
                initValue: 'Wedding',
              ),
              SizedBox(height: 3.8.h),
              const ProfileDataTextFormField(
                label: 'Date',
                initValue: '09:11 - 20/09/2021',
              ),
              SizedBox(height: 3.8.h),
              const ProfileDataTextFormField(
                label: 'Hall',
                initValue: 'Hall Name',
              ),
              SizedBox(height: 3.8.h),
              const ProfileDataTextFormField(
                label: 'Package',
                initValue: 'Package Name',
              ),
              SizedBox(height: 3.8.h),
              const ProfileDataTextFormField(
                label: 'Paying off',
                initValue: '2600 EGP',
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
