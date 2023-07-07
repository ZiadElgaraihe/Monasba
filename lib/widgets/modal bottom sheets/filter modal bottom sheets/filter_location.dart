import 'package:flutter/material.dart';
import 'package:monasba/providers/filter_provider.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/filter_back_button.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/filter_item_button.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/filter%20modal%20bottom%20sheets/filter_home.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FilterLocation extends StatelessWidget {
  const FilterLocation(
      {super.key, required this.listViewItems, required this.isCity});

  final bool isCity;
  final List listViewItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.4.w),
      margin: EdgeInsets.symmetric(horizontal: 4.4.w, vertical: 1.9.h),
      height: 35.h,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterBackButton(),
          Expanded(
            child: ListView.builder(
              itemCount: listViewItems.length,
              itemBuilder: (context, index) => FilterItemButton(
                  title: listViewItems[index],
                  appearLeftTrend: false,
                  onTap: () {
                    if (isCity) {
                      context
                          .read<FilterProvider>()
                          .changeCity(listViewItems[index]);
                    } else {
                      context
                          .read<FilterProvider>()
                          .changeCountry(listViewItems[index]);
                    }
                    Navigator.pop(context);
                    final AnimationController controller = AnimationController(
                      duration: const Duration(milliseconds: 750),
                      vsync: Navigator.of(context),
                    );
                    showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.white.withOpacity(0.3),
                      backgroundColor: Colors.transparent,
                      builder: (context) => const FilterHome(),
                      transitionAnimationController: controller,
                    );
                    controller.forward();
                  }),
            ),
          )
        ],
      ),
    );
  }
}
