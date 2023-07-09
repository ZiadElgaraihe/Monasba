import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:monasba/cubits/resend_forget_password_cubit/resend_forget_password_cubit.dart';
import 'package:monasba/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/fields/textformfields/password_text_form_field.dart';
import 'package:monasba/widgets/nav%20bar/app_navbar.dart';
import 'package:monasba/widgets/snackbars/error_snack_bar.dart';
import 'package:monasba/widgets/texts/page_definition.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  static String id = '/reset password page';

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is ResetPasswordSuccess) {
          Navigator.pop(context);
          context.read<ResendForgetPasswordCubit>().resetPasswordModel = null;
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppNavBar.id,
            (route) => false,
          );
        } else if (state is ResetPasswordFailure) {
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
                  PasswordTextFormField(
                      title: 'New Password',
                      passwordController: _newPasswordController),
                  SizedBox(
                    height: 3.8.h,
                  ),
                  PasswordTextFormField(
                      title: 'Confirm Password',
                      passwordController: _confirmPasswordController),
                  SizedBox(
                    height: 12.2.h,
                  ),
                  ColoredButton(
                      title: 'Submit',
                      pageMode: PageMode.dark,
                      onPressed: () {
                        context.read<ResetPasswordCubit>().resetPassword(
                              newPassword: _newPasswordController.text,
                              confirmPassword: _confirmPasswordController.text,
                              token: context
                                          .read<ResendForgetPasswordCubit>()
                                          .resetPasswordModel !=
                                      null
                                  ? context
                                      .read<ResendForgetPasswordCubit>()
                                      .resetPasswordModel!
                                      .token
                                  : context
                                      .read<ForgetPasswordCubit>()
                                      .resetPasswordModel!
                                      .token,
                            );
                      }),
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
