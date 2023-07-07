import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/providers/filter_provider.dart';
import 'package:monasba/widgets/buttons/text%20buttons/ok_text_button.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/filter%20modal%20bottom%20sheets/filter_home.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FilterPriceRange extends StatefulWidget {
  const FilterPriceRange({super.key});

  @override
  State<FilterPriceRange> createState() => _FilterPriceRangeState();
}

class _FilterPriceRangeState extends State<FilterPriceRange> {
  final ValueNotifier<RangeValues> _valueNotifier =
      ValueNotifier<RangeValues>(const RangeValues(0, 500));

  @override
  void initState() {
    if (context.read<FilterProvider>().priceRange != null) {
      _valueNotifier.value = context.read<FilterProvider>().priceRange!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.4.w),
      margin: EdgeInsets.symmetric(horizontal: 4.4.w, vertical: 1.9.h),
      height: 18.9.h,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: ValueListenableBuilder(
        valueListenable: _valueNotifier,
        builder: (context, value, child) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      final AnimationController controller =
                          AnimationController(
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
                    },
                    child: SvgPicture.asset(
                      'assets/icons/trends/Left.svg',
                      height: 3.8.h,
                      width: 6.7.w,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                          Colors.white, BlendMode.srcATop),
                    ),
                  ),
                  Text(
                    '${value.start.toInt()} EGP - ${value.end.toInt()} EGP',
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: RangeSlider(
                  divisions: 20,
                  activeColor: Colors.white,
                  inactiveColor: const Color(0xFF818181),
                  values: value,
                  min: 0,
                  max: 2000,
                  onChanged: (value) {
                    _valueNotifier.value = value;
                  },
                ),
              ),
            ),
            OkTextButton(onPressed: () {
              context.read<FilterProvider>().setRange(_valueNotifier.value);
            }),
          ],
        ),
      ),
    );
  }
}
