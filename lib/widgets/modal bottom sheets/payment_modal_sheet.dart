import 'package:flutter/material.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/filter_back_button.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/filter_item_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PaymentModalSheet extends StatelessWidget {
  const PaymentModalSheet(
      {super.key, required this.listViewItems, required this.isVisible});

  final List listViewItems;
  final ValueNotifier<bool> isVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.4.w),
      margin: EdgeInsets.symmetric(horizontal: 4.4.w, vertical: 1.9.h),
      height: 28.h,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterBackButton(isVisible: isVisible),
          Expanded(
            child: ListView.builder(
              itemCount: listViewItems.length,
              itemBuilder: (context, index) => FilterItemButton(
                  title: listViewItems[index],
                  appearLeftTrend: false,
                  onTap: () {
                    context
                        .read<ReservationCubit>()
                        .setPaymentWay(listViewItems[index]);
                    Navigator.pop(context);
                    isVisible.value = true;
                  }),
            ),
          )
        ],
      ),
    );
  }
}
