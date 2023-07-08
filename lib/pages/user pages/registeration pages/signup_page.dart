import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/sign_up_cubit/sign_up_cubit_cubit.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/login_page.dart';
import 'package:monasba/providers/location_dropdown_provider.dart';
import 'package:monasba/widgets/appbars/empty_appbar.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/buttons/floating%20action%20buttons/facebook_and_google_buttons.dart';
import 'package:monasba/widgets/buttons/checkboxes/privacy_checkbox.dart';
import 'package:monasba/widgets/fields/location_dropdown_field.dart';
import 'package:monasba/widgets/fields/textformfields/data_text_form_field.dart';
import 'package:monasba/widgets/fields/textformfields/password_text_form_field.dart';
import 'package:monasba/widgets/fields/textformfields/phone_text_form_field.dart';
import 'package:monasba/widgets/nav%20bar/app_navbar.dart';
import 'package:monasba/widgets/rows/text_and_button_row.dart';
import 'package:monasba/widgets/snackbars/error_snack_bar.dart';
import 'package:monasba/widgets/texts/or_divider.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String id = '/signup page';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpCubitLoading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          } else if (state is SignUpCubitFailed) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              errorSnackBar(msg: state.error),
            );
          } else if (state is SignUpCubitSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppNavBar.id, (route) => false);
          }
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Scaffold(
            backgroundColor: darkBackground,
            appBar: const EmptyAppBar(pageMode: PageMode.dark),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.4.w),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    const PageTitle(title: 'Sign up', pageMode: PageMode.dark),
                    SizedBox(height: 4.8.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              DataTextFormField(
                                  title: 'First Name',
                                  width: orientation == Orientation.landscape
                                      ? 47.h
                                      : 45.w,
                                  keyboardType: TextInputType.name,
                                  pageMode: PageMode.dark,
                                  dataController: _firstNameController,
                                  validator: (value, title) {
                                    return namesValidator(value, title);
                                  }),
                              DataTextFormField(
                                  title: 'Last Name',
                                  width: orientation == Orientation.landscape
                                      ? 47.h
                                      : 45.w,
                                  keyboardType: TextInputType.name,
                                  pageMode: PageMode.dark,
                                  dataController: _lastNameController,
                                  validator: (value, title) {
                                    return namesValidator(value, title);
                                  }),
                            ],
                          ),
                          SizedBox(height: 2.5.h),
                          DataTextFormField(
                              title: 'Username',
                              width: double.infinity,
                              keyboardType: TextInputType.name,
                              pageMode: PageMode.dark,
                              dataController: _userNameController,
                              validator: (value, title) {
                                return namesValidator(value, title);
                              }),
                          SizedBox(height: 2.5.h),
                          DataTextFormField(
                            title: 'Email',
                            width: double.infinity,
                            keyboardType: TextInputType.emailAddress,
                            pageMode: PageMode.dark,
                            dataController: _emailController,
                            validator: (value, title) {
                              return emailValidator(value, title);
                            },
                          ),
                          SizedBox(height: 2.5.h),
                          PasswordTextFormField(
                            title: 'Password',
                            passwordController: _passwordController,
                            validator: (value, title) {
                              return passwordValidator(value, title);
                            },
                          ),
                          SizedBox(height: 2.5.h),
                          LocationDropdownField(
                              pageMode: PageMode.dark,
                              orientation: orientation),
                          SizedBox(height: 2.5.h),
                          PhoneTextFormField(
                            color: Colors.white,
                            pageMode: PageMode.dark,
                            phoneController: _phoneNumberController,
                            validator: (value) {
                              return phoneValidator(value);
                            },
                            orientation: orientation,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.8.h),
                    const PrivacyCheckbox(),
                    SizedBox(height: 3.8.h),
                    ColoredButton(
                      title: 'Sign up',
                      pageMode: PageMode.dark,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await BlocProvider.of<SignUpCubit>(context).signUp(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              userName: _userNameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              country: 'Egypt',
                              city: context
                                      .read<LocationDropDownProvider>()
                                      .selectedCity ??
                                  '',
                              phoneNumber: '+20${_phoneNumberController.text}');
                        }
                      },
                    ),
                    SizedBox(height: 2.5.h),
                    TextAndButtonRow(
                        buttonTitle: 'Log in',
                        text: 'already',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, LoginPage.id);
                        }),
                    SizedBox(height: 3.8.h),
                    const OrDivider(pageMode: PageMode.dark),
                    SizedBox(height: 3.8.h),
                    const FacebookAndGoogleButtons(),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? namesValidator(String? value, String title) {
    if (value == null || value.isEmpty) {
      return '$title is required';
    } else if (value.length < 3) {
      return 'Too short $title';
    }
    return null;
  }

  String? emailValidator(String? value, String title) {
    if (value == null || value.isEmpty) {
      return '$title is required';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Invalid ${title.toLowerCase()} address';
    }
    return null;
  }

  String? passwordValidator(String? value, String title) {
    if (value == null || value.isEmpty) {
      return '$title is required';
    } else if (value.length < 6) {
      return '$title must be at least 6 characters';
    }
    return null;
  }

  String? phoneValidator(value) {
    if (value != null &&
        !RegExp(r'^\+20(10|11|12|15)[0-9]{8}$').hasMatch('+20$value')) {
      return 'Invalid phone number';
    }
    return null;
  }
}
