import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/pages/user%20pages/reservation%20pages/success_page.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/containers/confirm%20detail%20boxes/customer_detail.dart';
import 'package:monasba/widgets/containers/confirm%20detail%20boxes/date_detail.dart';
import 'package:monasba/widgets/containers/confirm%20detail%20boxes/hall_detail.dart';
import 'package:monasba/widgets/containers/confirm%20detail%20boxes/payment_detail.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ConfirmDetailPage extends StatefulWidget {
  const ConfirmDetailPage({super.key});

  static String id = '/confirm detail page';

  @override
  State<ConfirmDetailPage> createState() => _ConfirmDetailPageState();
}

class _ConfirmDetailPageState extends State<ConfirmDetailPage> {
  late final ReservationCubit _reservationCubit;

  @override
  void initState() {
    super.initState();
    _reservationCubit = context.read<ReservationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: const AppBarDesign(pageMode: PageMode.light),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.9.w),
          child: Column(
            children: [
              DateDetails(reservationCubit: _reservationCubit),
              SizedBox(height: 1.3.h),
              HallDetails(reservationCubit: _reservationCubit),
              SizedBox(height: 1.3.h),
              CustomerDetails(reservationCubit: _reservationCubit),
              SizedBox(height: 1.3.h),
              PaymentDetails(reservationCubit: _reservationCubit),
              SizedBox(height: 5.h),
              ColoredButton(
                  title: 'Confirm',
                  pageMode: PageMode.light,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, SuccessPage.id, (route) => false);
                  }),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
