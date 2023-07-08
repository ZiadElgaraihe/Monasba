import 'package:flutter/material.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/widgets/texts/confirm_detail.dart';
import 'package:monasba/widgets/texts/confirm_title.dart';
import 'package:sizer/sizer.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({super.key, required this.reservationCubit});

  final ReservationCubit reservationCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 25.2.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ConfirmTitle(title: 'Customer Info'),
          SizedBox(height: 3.6.h),
          ConfirmDetail(
              title: reservationCubit.customerName ?? 'Customer name : N/A'),
          SizedBox(height: 3.3.h),
          const ConfirmDetail(title: '+201207420805'),
          SizedBox(height: 3.3.h),
          ConfirmDetail(
              title: reservationCubit.guarantorName ?? 'Guarantor name : N/A'),
        ],
      ),
    );
  }
}
