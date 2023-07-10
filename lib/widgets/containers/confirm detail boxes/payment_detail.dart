import 'package:flutter/material.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/widgets/texts/confirm_detail.dart';
import 'package:monasba/widgets/texts/confirm_title.dart';
import 'package:sizer/sizer.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key, required this.reservationCubit});

  final ReservationCubit reservationCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 32.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const ConfirmTitle(title: 'Payment'),
          SizedBox(height: 3.6.h),
          ConfirmDetail(title: reservationCubit.paymentWay ?? 'Pay with : N/A'),
          SizedBox(height: 3.3.h),
          ConfirmDetail(
              title: reservationCubit.creditHolderName ??
                  'Credit holder name : N/A'),
          SizedBox(height: 3.3.h),
          ConfirmDetail(
              title: reservationCubit.creditNumber ?? 'Credit number : N/A'),
          SizedBox(height: 3.3.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  reservationCubit.expirationDate ?? 'N/A',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 35.6.w),
                Text(
                  reservationCubit.securityCode ?? 'N/A',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
