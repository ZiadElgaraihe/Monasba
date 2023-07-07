import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/providers/filter_provider.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/filter_item_button.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/filter%20modal%20bottom%20sheets/filter_calender.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/filter%20modal%20bottom%20sheets/filter_location.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/filter%20modal%20bottom%20sheets/filter_occasion.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/filter%20modal%20bottom%20sheets/filter_price_range.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/filter%20modal%20bottom%20sheets/filter_review.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FilterHome extends StatefulWidget {
  const FilterHome({super.key});

  @override
  State<FilterHome> createState() => _FilterHomeState();
}

class _FilterHomeState extends State<FilterHome> {
  void animateModalSheet(Widget builder) {
    final AnimationController controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: Navigator.of(context),
    );
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.white.withOpacity(0.3),
      backgroundColor: Colors.transparent,
      builder: (context) => builder,
      transitionAnimationController: controller,
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.4.w),
      margin: EdgeInsets.symmetric(horizontal: 4.4.w, vertical: 1.9.h),
      height: 56.3.h,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.3.h),
            child: Text('Filter',
                style: TextStyle(color: Colors.white, fontSize: 14.14.sp)),
          ),
          Expanded(
            child: ListView(
              children: [
                FilterItemButton(
                    title: 'Calender',
                    appearLeftTrend: true,
                    onTap: () {
                      Navigator.pop(context);
                      animateModalSheet(const FilterCalender());
                    }),
                FilterItemButton(
                    title: 'Occasion',
                    appearLeftTrend: true,
                    onTap: () {
                      Navigator.pop(context);
                      animateModalSheet(const FilterOccasion());
                    }),
                Selector<FilterProvider, String?>(
                  selector: (context, provider) => provider.selectedCountry,
                  builder: (context, value, child) => FilterItemButton(
                      title: value ?? 'Country',
                      appearLeftTrend: true,
                      onTap: () {
                        Navigator.pop(context);
                        animateModalSheet(FilterLocation(
                            isCity: false,
                            listViewItems: locationData.keys.toList()));
                      }),
                ),
                Consumer<FilterProvider>(
                  builder: (context, value, child) => FilterItemButton(
                      title: value.selectedCity ?? 'City',
                      appearLeftTrend: true,
                      onTap: () {
                        Navigator.pop(context);
                        animateModalSheet(FilterLocation(
                            isCity: true,
                            listViewItems: value.selectedCountry != null
                                ? locationData[value.selectedCountry]!['city']
                                : []));
                      }),
                ),
                FilterItemButton(
                    title: 'Price Range',
                    appearLeftTrend: true,
                    onTap: () {
                      Navigator.pop(context);
                      animateModalSheet(const FilterPriceRange());
                    }),
                FilterItemButton(
                    title: 'Customer Review',
                    appearLeftTrend: true,
                    onTap: () {
                      Navigator.pop(context);
                      animateModalSheet(const FilterReview());
                    }),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.3.h),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel',
                        style:
                            TextStyle(color: Colors.white, fontSize: 12.sp))),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      context.read<FilterProvider>().reset();
                    },
                    child: Text('Reset',
                        style:
                            TextStyle(color: Colors.white, fontSize: 12.sp))),
                TextButton(
                    onPressed: () {},
                    child: Text('Apply',
                        style: TextStyle(color: Colors.white, fontSize: 12.sp)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
