import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/email_verification_code_page.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/fields/textformfields/data_text_form_field.dart';
import 'package:monasba/widgets/fields/textformfields/phone_text_form_field.dart';
import 'package:monasba/widgets/texts/or_divider.dart';
import 'package:monasba/widgets/texts/page_definition.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  static String id = '/forget password page';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: darkBackground,
        appBar: const AppBarDesign(
          title: 'Forget Password',
          pageMode: PageMode.dark,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.4.w),
            child: Column(
              children: [
                SizedBox(height: 18.4.h),
                const PageTitle(
                    title: 'Forget Password', pageMode: PageMode.dark),
                SizedBox(height: 3.8.h),
                const PageDefinition(
                    title:
                        'If you forget your password don’t worry, we can handle it so please add the data you have entered to the system',
                    pageMode: PageMode.dark),
                SizedBox(height: 5.h),
                const DataTextFormField(
                  width: double.infinity,
                  title: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  pageMode: PageMode.dark,
                ),
                SizedBox(height: 3.8.h),
                const OrDivider(pageMode: PageMode.dark),
                SizedBox(height: 3.8.h),
                const PhoneTextFormField(
                    color: Colors.white, pageMode: PageMode.dark),
                SizedBox(height: 8.8.h),
                ColoredButton(
                    title: 'Submit',
                    pageMode: PageMode.dark,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, EmailVerificationCodePage.id);
                    }),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
