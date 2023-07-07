import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/reset_password_page.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/fields/textformfields/otp_text_form_field.dart';
import 'package:monasba/widgets/texts/page_definition.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class EmailVerificationCodePage extends StatelessWidget {
  const EmailVerificationCodePage({super.key});

  static String id = '/email verification code page';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: darkBackground,
        appBar: const AppBarDesign(
          title: 'Verification code',
          pageMode: PageMode.dark,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.4.w),
            child: Column(
              children: [
                SizedBox(
                  height: 18.4.h,
                ),
                const PageTitle(
                  title: 'Verification code',
                  pageMode: PageMode.dark,
                ),
                SizedBox(
                  height: 3.8.h,
                ),
                const PageDefinition(
                    title:
                        'Four digit code have sent to your number, Please enter the sent code',
                    pageMode: PageMode.dark),
                SizedBox(
                  height: 8.4.h,
                ),
                const OtpTextFormField(),
                SizedBox(
                  height: 13.8.h,
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      overlayColor: const MaterialStatePropertyAll(Colors.grey),
                      fixedSize: MaterialStatePropertyAll(Size(59.7.w, 5.9.h)),
                      side: const MaterialStatePropertyAll(
                          BorderSide(color: Colors.white))),
                  child: Text(
                    'Send again',
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                ColoredButton(
                  title: 'Submit',
                  pageMode: PageMode.dark,
                  onPressed: () {
                    Navigator.pushNamed(context, ResetPasswordPage.id);
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
