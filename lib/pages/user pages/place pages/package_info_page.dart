import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/pages/user%20pages/reservation%20pages/calender_reserve_page.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/containers/package_info_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PackageInfoPage extends StatefulWidget {
  const PackageInfoPage({super.key, required this.isFilter});

  final bool isFilter;

  @override
  State<PackageInfoPage> createState() => _PackageInfoPageState();
}

class _PackageInfoPageState extends State<PackageInfoPage> {
  final ValueNotifier<int?> _selectedIndex = ValueNotifier<int?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: AppBarDesign(
        pageMode: PageMode.light,
        title: 'Dream Package',
        actions: [
          widget.isFilter
              ? TextButton(
                  onPressed: () {
                    //  Navigator.pushNamed(context, .id);
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    //  Navigator.pushNamed(context, .id);
                  },
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.4.w),
          child: Column(
            children: [
              SizedBox(height: 3.8.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: personsAndPrices.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.4.h),
                  child: Row(
                    children: [
                      Text(
                        personsAndPrices[index]['number of persons']!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 1.1.w),
                      Text(
                        'Person',
                        style: TextStyle(color: Colors.black, fontSize: 10.sp),
                      ),
                      const Spacer(),
                      Text(
                        personsAndPrices[index]['price']!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 1.1.w),
                      Text(
                        'EGP',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 3.1.w),
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
                                context.read<ReservationCubit>().selectPackage(
                                    personsAndPrices[index]
                                        ['number of persons']!,
                                    personsAndPrices[index]['price']!);
                              },
                              child: Container(
                                width: 4.9.w,
                                height: 3.h,
                                decoration: BoxDecoration(
                                    color: index == value
                                        ? const Color(0xFFed9526)
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: index == value
                                            ? Colors.orange.shade300
                                            : Colors.black,
                                        width: index == value ? 1.5 : 2),
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
              SizedBox(height: 7.5.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: packageInfo.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.25.h),
                  child: PackageInfoContainer(
                      title: packageInfo[index]['title']!,
                      content: packageInfo[index]['content']!),
                ),
              ),
              SizedBox(height: 10.h),
              ColoredButton(
                title: 'Check Date',
                pageMode: PageMode.light,
                width: 60.5.w,
                height: 5.6.h,
                fontSize: 14.sp,
                onPressed: () {
                  Navigator.pushNamed(context, CalenderReservePage.id);
                },
              ),
              SizedBox(height: 10.9.h),
            ],
          ),
        ),
      ),
    );
  }
}
