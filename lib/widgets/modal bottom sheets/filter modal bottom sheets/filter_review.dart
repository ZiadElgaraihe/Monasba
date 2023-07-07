import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/providers/filter_provider.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/filter_back_button.dart';
import 'package:monasba/widgets/buttons/text%20buttons/ok_text_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FilterReview extends StatefulWidget {
  const FilterReview({super.key});

  @override
  State<FilterReview> createState() => _FilterReviewState();
}

class _FilterReviewState extends State<FilterReview> {
  final ValueNotifier<int?> _selectedIndex = ValueNotifier<int?>(null);

  @override
  void initState() {
    if (context.read<FilterProvider>().rate != null) {
      _selectedIndex.value =
          5 - int.parse(context.read<FilterProvider>().rate!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.4.w),
      margin: EdgeInsets.symmetric(horizontal: 4.4.w, vertical: 1.9.h),
      height: 47.8.h,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterBackButton(),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                height: 5.3.h,
                margin: EdgeInsets.symmetric(vertical: 0.6.h),
                padding: EdgeInsets.symmetric(horizontal: 4.4.w),
                child: Row(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, starsIndex) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.3.w),
                        child: SvgPicture.asset(
                          'assets/icons/star_colored.svg',
                          height: 3.1.h,
                          colorFilter: ColorFilter.mode(
                              (starsIndex < 5 - index)
                                  ? const Color(0xFFff9529)
                                  : const Color(0xFFdfdfdf),
                              BlendMode.srcATop),
                        ),
                      ),
                    ),
                    SizedBox(width: 1.4.w),
                    Text(
                      '${(5 - index).toDouble()}',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                    const Spacer(),
                    Theme(
                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor: const Color(0xFFb0b0b0)),
                      child: ValueListenableBuilder(
                        valueListenable: _selectedIndex,
                        builder: (context, value, child) => Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              _selectedIndex.value = index;
                            },
                            child: Container(
                              width: 4.9.w,
                              height: 3.h,
                              decoration: BoxDecoration(
                                  color: index == value
                                      ? Colors.orange
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: index == value
                                          ? Colors.transparent
                                          : const Color(0xFFb0b0b0),
                                      width: 2),
                                  shape: BoxShape.circle),
                              child: index == value
                                  ? SvgPicture.asset('assets/icons/done.svg')
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          OkTextButton(onPressed: () {
            if (_selectedIndex.value != null) {
              context
                  .read<FilterProvider>()
                  .setRate((5 - _selectedIndex.value!).toString());
            }
          }),
        ],
      ),
    );
  }
}
