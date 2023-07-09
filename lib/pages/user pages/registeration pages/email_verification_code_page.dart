import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:monasba/cubits/resend_forget_password_cubit/resend_forget_password_cubit.dart';
import 'package:monasba/cubits/verify_password_cubit/verify_password_cubit.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/reset_password_page.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/fields/textformfields/otp_text_form_field.dart';
import 'package:monasba/widgets/snackbars/error_snack_bar.dart';
import 'package:monasba/widgets/texts/page_definition.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class EmailVerificationCodePage extends StatefulWidget {
  const EmailVerificationCodePage({super.key});

  static String id = '/email verification code page';

  @override
  State<EmailVerificationCodePage> createState() =>
      _EmailVerificationCodePageState();
}

class _EmailVerificationCodePageState extends State<EmailVerificationCodePage> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyPasswordCubit, VerifyPasswordState>(
      listener: (context, state) {
        if (state is VerifyPasswordLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is VerifyPasswordSuccess) {
          Navigator.pop(context);
          Navigator.pushNamed(context, ResetPasswordPage.id);
        } else if (state is VerifyPasswordFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar(msg: state.error),
          );
        }
      },
      child: GestureDetector(
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
                  OtpTextFormField(otpControllers: _otpControllers),
                  SizedBox(
                    height: 13.8.h,
                  ),
                  BlocConsumer<ResendForgetPasswordCubit,
                      ResendForgetPasswordState>(
                    listener: (context, state) {
                      if (state is ResendForgetPasswordSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          errorSnackBar(msg: 'Reset code send to email'),
                        );
                      } else if (state is ResendForgetPasswordFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          errorSnackBar(msg: state.error),
                        );
                      }
                    },
                    builder: (context, state) {
                      return OutlinedButton(
                        onPressed: () async {
                          await context
                              .read<ResendForgetPasswordCubit>()
                              .resendForgetPassword(
                                  token: context
                                      .read<ForgetPasswordCubit>()
                                      .resetPasswordModel!
                                      .token);
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            overlayColor:
                                const MaterialStatePropertyAll(Colors.grey),
                            fixedSize:
                                MaterialStatePropertyAll(Size(59.7.w, 5.9.h)),
                            side: const MaterialStatePropertyAll(
                                BorderSide(color: Colors.white))),
                        child: (state is ResendForgetPasswordLoading)
                            ? SizedBox(
                                height: 3.h,
                                width: 6.w,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 0.7.w,
                                ))
                            : Text(
                                'Send again',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.sp),
                              ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  ColoredButton(
                    title: 'Submit',
                    pageMode: PageMode.dark,
                    onPressed: () async {
                      String otpCode = '';
                      for (int i = 0; i < _otpControllers.length; i++) {
                        otpCode += _otpControllers[i].text;
                      }
                      await context
                          .read<VerifyPasswordCubit>()
                          .verifyPassword(resetCode: otpCode);
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
      ),
    );
  }
}
