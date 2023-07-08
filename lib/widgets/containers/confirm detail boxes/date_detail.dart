import 'package:flutter/material.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/widgets/texts/confirm_detail.dart';
import 'package:monasba/widgets/texts/confirm_title.dart';
import 'package:sizer/sizer.dart';

class DateDetails extends StatelessWidget {
  const DateDetails({super.key, required this.reservationCubit});

  final ReservationCubit reservationCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 18.4.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ConfirmTitle(title: 'Date'),
          SizedBox(height: 3.6.h),
          ConfirmDetail(title: reservationCubit.day ?? 'Day : N/A'),
          SizedBox(height: 2.3.h),
          ConfirmDetail(
              title: reservationCubit.time?.format(context) ?? 'Time : N/A'),
        ],
      ),
    );
  }
}
