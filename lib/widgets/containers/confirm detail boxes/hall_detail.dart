import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/widgets/rows/package_info_item.dart';
import 'package:monasba/widgets/texts/confirm_detail.dart';
import 'package:monasba/widgets/texts/confirm_title.dart';
import 'package:sizer/sizer.dart';

class HallDetails extends StatelessWidget {
  const HallDetails({super.key, required this.reservationCubit});

  final ReservationCubit reservationCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.6.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const ConfirmTitle(title: 'Hall Info'),
          SizedBox(height: 3.6.h),
          const ConfirmDetail(title: 'Hall Name'),
          SizedBox(height: 3.4.h),
          const ConfirmDetail(title: 'Dream Package'),
          SizedBox(height: 3.4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PackageInfoItem(
                  value:
                      context.read<ReservationCubit>().numberOfPersons ?? 'N/A',
                  title: 'Person',
                  color: Colors.black,
                ),
                PackageInfoItem(
                  value: context.read<ReservationCubit>().price ?? 'N/A',
                  title: 'EGP',
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
