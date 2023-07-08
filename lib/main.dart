import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/cubits/sign_up_cubit/sign_up_cubit_cubit.dart';
import 'package:monasba/network/remote/dio_helper.dart';
import 'package:monasba/network/local/cache_helper.dart';
import 'package:monasba/cubits/login/login_cubit.dart';
import 'package:monasba/pages/owner%20pages/calender/ownercalender.dart';
import 'package:monasba/pages/owner%20pages/reservation%20user/reservation_info_page.dart';
import 'package:monasba/pages/user%20pages/contact%20us%20pages/contact_us_page_one.dart';
import 'package:monasba/pages/user%20pages/contact%20us%20pages/contact_us_page_two.dart';
import 'package:monasba/pages/user%20pages/home%20pages/search_page.dart';
import 'package:monasba/pages/user%20pages/profile%20pages/edit_profile.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/email_verification_code_page.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/forget_password_page.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/login_page.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/reset_password_page.dart';
import 'package:monasba/pages/user%20pages/registeration%20pages/signup_page.dart';
import 'package:monasba/pages/user%20pages/reservation%20pages/calender_reserve_page.dart';
import 'package:monasba/pages/user%20pages/reservation%20pages/confirm_detail_page.dart';
import 'package:monasba/pages/user%20pages/reservation%20pages/reserve_hall_page.dart';
import 'package:monasba/pages/user%20pages/reservation%20pages/success_page.dart';
import 'package:monasba/pages/user%20pages/sidebar%20pages/history_page.dart';
import 'package:monasba/pages/user%20pages/sidebar%20pages/notification_page.dart';
import 'package:monasba/pages/user%20pages/sidebar%20pages/reservation%20pages/reservation_information_page.dart';
import 'package:monasba/pages/user%20pages/sidebar%20pages/reservation%20pages/reservation_page.dart';
import 'package:monasba/pages/user%20pages/sidebar%20pages/review_page.dart';
import 'package:monasba/pages/user%20pages/welcome%20pages/logo_splash_screen.dart';
import 'package:monasba/pages/owner%20pages/Owner%20Regestration/owner_regestration.dart';
import 'package:monasba/pages/owner%20pages/nav%20bar/owner_navbar.dart';
import 'package:monasba/widgets/nav%20bar/app_navbar.dart';
import 'package:monasba/providers/chat_provider.dart';
import 'package:monasba/providers/filter_provider.dart';
import 'package:monasba/providers/gender_dropdown_provider.dart';
import 'package:monasba/providers/location_dropdown_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'pages/owner pages/reservation user/reservation_user_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  CacheHelpr.init;
  runApp(const Monasba());
}

class Monasba extends StatelessWidget {
  const Monasba({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider<ReservationCubit>(
          create: (context) => ReservationCubit(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LocationDropDownProvider>(
            create: (context) => LocationDropDownProvider(),
          ),
          ChangeNotifierProvider<ChatProvider>(
            create: (context) => ChatProvider(),
          ),
          ChangeNotifierProvider<GenderDropDownProvider>(
            create: (context) => GenderDropDownProvider(),
          ),
          ChangeNotifierProvider<FilterProvider>(
            create: (context) => FilterProvider(),
          ),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Monasba',
            routes: {
              LogoSplashScreen.id: (context) => const LogoSplashScreen(),
              LoginPage.id: (context) => const LoginPage(),
              SignupPage.id: (context) => const SignupPage(),
              ForgetPasswordPage.id: (context) => const ForgetPasswordPage(),
              EmailVerificationCodePage.id: (context) =>
                  const EmailVerificationCodePage(),
              ResetPasswordPage.id: (context) => const ResetPasswordPage(),
              ContactUsPageOne.id: (context) => const ContactUsPageOne(),
              ContactUsPageTwo.id: (context) => const ContactUsPageTwo(),
              AppNavBar.id: (context) => const AppNavBar(),
              EditProfile.id: (context) => const EditProfile(),
              SearchPage.id: (context) => const SearchPage(),
              HistoryPage.id: (context) => const HistoryPage(),
              NotificationPage.id: (context) => const NotificationPage(),
              ReservationPage.id: (context) => const ReservationPage(),
              ReservationInformationPage.id: (context) =>
                  const ReservationInformationPage(),
              ReviewPage.id: (context) => const ReviewPage(),
              OwnerRegstration.id: (context) => const OwnerRegstration(),
              OwnerAppNavBar.id: (context) => const OwnerAppNavBar(),
              CalenderReservePage.id: (context) => const CalenderReservePage(),
              OwnerCalender.id: (context) => const OwnerCalender(),
              ConfirmDetailPage.id: (context) => const ConfirmDetailPage(),
              SuccessPage.id: (context) => const SuccessPage(),
              ReserveHallPage.id: (context) => const ReserveHallPage(),
              ReservationUserPage.id: (context) => const ReservationUserPage(),
              ReservationInfoPage.id: (context) => const ReservationInfoPage(),
            },
            //The starting page
            initialRoute: AppNavBar.id,
          ),
        ),
      ),
    );
  }
}
