import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/login/login_cubit.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/forget_password_page.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/signup_page.dart';
import 'package:monasba/widgets/appbars/empty_appbar.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/buttons/floating%20action%20buttons/facebook_and_google_buttons.dart';
import 'package:monasba/widgets/fields/textformfields/data_text_form_field.dart';
import 'package:monasba/widgets/fields/textformfields/password_text_form_field.dart';
import 'package:monasba/widgets/nav%20bar/app_navbar.dart';
import 'package:monasba/widgets/rows/text_and_button_row.dart';
import 'package:monasba/widgets/texts/or_divider.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String id = '/login page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: darkBackground,
        appBar: const EmptyAppBar(pageMode: PageMode.dark),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.4.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  const PageTitle(
                    title: 'Log in',
                    pageMode: PageMode.dark,
                  ),
                  SizedBox(
                    height: 14.5.h,
                  ),
                  DataTextFormField(
                    validator: (value, title) {
                      if (value!.isEmpty) {
                        return "Email Must Not Be Empty ";
                      }
                      return null;
                    },
                    dataController: emailController,
                    title: 'Email',
                    width: double.infinity,
                    keyboardType: TextInputType.emailAddress,
                    pageMode: PageMode.dark,
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  PasswordTextFormField(
                    validator: (value, title) {
                      if (value!.isEmpty) {
                        return "password shor yalaaaa ";
                      }
                      return null;
                    },
                    passwordController: passwordController,
                    title: 'Password',
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0.5.w),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, ForgetPasswordPage.id);
                          },
                          child: const Text(
                            'Forget Password ?',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, AppNavBar.id);
                      } else if (state is LoginError) {
                        Navigator.pop(context);
                        if (formKey.currentState!.validate()) {
                          // ignore: avoid_print
                          print(emailController.text);
                          // ignore: avoid_print
                          print(passwordController.text);
                        }
                      } else if (state is LoginLoading) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ColoredButton(
                          title: 'Log in',
                          pageMode: PageMode.dark,
                          onPressed: () //async
                              {
                            LoginCubit.get(context).userSignIn(
                                emailController.text, passwordController.text);
                          });
                    },
                  ),
                  TextAndButtonRow(
                      buttonTitle: 'Sign up',
                      text: 'don\'t',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, SignupPage.id);
                      }),
                  SizedBox(
                    height: 1.25.h,
                  ),
                  const OrDivider(pageMode: PageMode.dark),
                  SizedBox(
                    height: 3.8.h,
                  ),
                  const FacebookAndGoogleButtons(),
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
