import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/fields/textformfields/password_text_form_field.dart';
import 'package:monasba/widgets/texts/page_definition.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  static String id = '/reset password page';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: darkBackground,
        appBar: const AppBarDesign(
          title: 'Reset Password',
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
                    title: 'Reset Password', pageMode: PageMode.dark),
                SizedBox(
                  height: 3.8.h,
                ),
                const PageDefinition(
                    title:
                        'You will need to log back in to make sure you remember it',
                    pageMode: PageMode.dark),
                SizedBox(
                  height: 8.4.h,
                ),
                const PasswordTextFormField(title: 'New Password'),
                SizedBox(
                  height: 3.8.h,
                ),
                const PasswordTextFormField(title: 'Confirm Password'),
                SizedBox(
                  height: 12.2.h,
                ),
                const ColoredButton(title: 'Submit', pageMode: PageMode.dark),
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
