import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/fields/gender_dropdown_field.dart';
import 'package:monasba/widgets/fields/location_dropdown_field.dart';
import 'package:monasba/widgets/fields/textformfields/data_text_form_field.dart';
import 'package:monasba/widgets/fields/textformfields/phone_text_form_field.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/edit_photo_modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  static String id = '/edit profile';

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          backgroundColor: lightBackground,
          appBar: AppBarDesign(
            title: 'Edit Profile',
            pageMode: PageMode.light,
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.4.w),
              child: Column(
                children: [
                  const SizedBox(height: 3.8),
                  Center(
                    child: SizedBox(
                      height: 20.h,
                      width: 35.6.w,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            barrierColor: Colors.white.withOpacity(0.3),
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                const EditPhotoModalBottomSheet(),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Image.asset(
                            'assets/images/Ellipse 3.png',
                            height: 20.h,
                            width: 35.6.w,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      DataTextFormField(
                          width: orientation == Orientation.landscape
                              ? 47.h
                              : 45.w,
                          title: 'First name',
                          keyboardType: TextInputType.name,
                          pageMode: PageMode.light),
                      DataTextFormField(
                          width: orientation == Orientation.landscape
                              ? 47.h
                              : 45.w,
                          title: 'Last name',
                          keyboardType: TextInputType.name,
                          pageMode: PageMode.light),
                    ],
                  ),
                  SizedBox(height: 2.5.h),
                  const DataTextFormField(
                      width: double.infinity,
                      title: 'Full name',
                      keyboardType: TextInputType.name,
                      pageMode: PageMode.light),
                  SizedBox(height: 2.5.h),
                  const DataTextFormField(
                      width: double.infinity,
                      title: 'E-mail',
                      keyboardType: TextInputType.emailAddress,
                      pageMode: PageMode.light),
                  SizedBox(height: 2.5.h),
                  const GenderDropDownField(),
                  SizedBox(height: 2.5.h),
                  LocationDropdownField(
                      pageMode: PageMode.light, orientation: orientation),
                  SizedBox(height: 2.5.h),
                  const PhoneTextFormField(
                      color: Colors.black, pageMode: PageMode.light),
                  SizedBox(
                      height: orientation == Orientation.landscape ? 15.h : 5.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
