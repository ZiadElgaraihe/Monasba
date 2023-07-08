import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/pages/user%20pages/reservation%20pages/confirm_detail_page.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/containers/reservation%20animated%20containers/customer_info_animated_container.dart';
import 'package:monasba/widgets/containers/reservation%20animated%20containers/hall_info_animated_container.dart';
import 'package:monasba/widgets/containers/reservation%20animated%20containers/payment_animated_container.dart';
import 'package:monasba/widgets/rows/date_animated_container_item.dart';
import 'package:monasba/widgets/rows/package_info_item.dart';
import 'package:monasba/widgets/rows/phone_number_row.dart';
import 'package:sizer/sizer.dart';

class ReserveHallPage extends StatefulWidget {
  const ReserveHallPage({super.key});

  static String id = '/reserve hall page';

  @override
  State<ReserveHallPage> createState() => _ReserveHallPageState();
}

class _ReserveHallPageState extends State<ReserveHallPage> {
  final ValueNotifier<bool> _isHallContainerVisible = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _isHallInfoVisible = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isCustomerContainerVisible =
      ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isCustomerInfoVisible = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isPaymentContainerVisible =
      ValueNotifier<bool>(false);
  // final ValueNotifier<bool> _ispaymentInfoVisible = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: lightBackground,
        appBar: const AppBarDesign(pageMode: PageMode.light),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.9.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                    valueListenable: _isHallInfoVisible,
                    builder: (context, value, child) => AnimatedContainer(
                      height: value ? 5.5.h : 0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 1.3.h),
                        child: const ReservationItem(
                            icon: 'assets/icons/reservation icons/hall.svg',
                            title: '',
                            value: 'Hall Name',
                            pageMode: PageMode.light),
                      ),
                    ),
                  ),
                  ReservationItem(
                    icon: 'assets/icons/reservation icons/day.svg',
                    title: 'No choosen date',
                    value: context.read<ReservationCubit>().day,
                    pageMode: PageMode.light,
                  ),
                  SizedBox(height: 1.3.h),
                  ReservationItem(
                    icon: 'assets/icons/reservation icons/time.svg',
                    title: 'No choosen time',
                    value:
                        context.read<ReservationCubit>().time?.format(context),
                    pageMode: PageMode.light,
                  ),
                  SizedBox(height: 1.3.h),
                  ValueListenableBuilder(
                    valueListenable: _isHallInfoVisible,
                    builder: (context, value, child) => AnimatedContainer(
                      height: value ? 5.5.h : 0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 1.3.h),
                        child: const ReservationItem(
                            icon: 'assets/icons/reservation icons/package.svg',
                            title: '',
                            value: 'Package Name',
                            pageMode: PageMode.light),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _isHallInfoVisible,
                    builder: (context, value, child) => AnimatedContainer(
                      height: value ? 5.5.h : 0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 1.3.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PackageInfoItem(
                                value: context
                                        .read<ReservationCubit>()
                                        .numberOfPersons ??
                                    'N/A',
                                title: 'Person',
                                color: const Color(0xFF686868)),
                            PackageInfoItem(
                                value: context.read<ReservationCubit>().price ??
                                    'N/A',
                                title: 'EGP',
                                color: const Color(0xFF686868)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _isCustomerInfoVisible,
                    builder: (context, value, child) => AnimatedContainer(
                      height: value ? 5.5.h : 0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 1.3.h),
                        child: Text(
                          context.read<ReservationCubit>().customerName ??
                              'Name : N/A',
                          style: TextStyle(
                            color: const Color(0xFF686868),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _isCustomerInfoVisible,
                    builder: (context, value, child) => AnimatedContainer(
                      height: value ? 5.5.h : 0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        context.read<ReservationCubit>().customerId ??
                            'Id : N/A',
                        style: TextStyle(
                          color: const Color(0xFF686868),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _isCustomerInfoVisible,
                    builder: (context, value, child) => AnimatedContainer(
                      height: value ? 5.5.h : 0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      child: const PhoneNumberRow(pageMode: PageMode.light),
                    ),
                  ),
                  const Spacer(flex: 5),
                  Align(
                    alignment: Alignment.center,
                    child: ColoredButton(
                      title: 'Open',
                      pageMode: PageMode.light,
                      onPressed: () {
                        if (_isCustomerInfoVisible.value) {
                          _isPaymentContainerVisible.value = true;
                        } else if (_isHallInfoVisible.value) {
                          _isCustomerContainerVisible.value = true;
                        } else {
                          _isHallContainerVisible.value = true;
                        }
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Positioned(
              bottom: 2.5.h,
              right: 4.4.w,
              left: 4.4.w,
              child: ValueListenableBuilder(
                valueListenable: _isHallContainerVisible,
                builder: (context, value, child) => HallInfoAnimatedContainer(
                    isVisible: _isHallContainerVisible,
                    onBackPressed: () {
                      Navigator.pop(context);
                    },
                    onContinuePressed: () {
                      _isHallInfoVisible.value = true;
                      _isHallContainerVisible.value = false;
                      Future.delayed(
                        const Duration(milliseconds: 450),
                        () {
                          _isCustomerContainerVisible.value = true;
                        },
                      );
                    }),
              ),
            ),
            Positioned(
              bottom: 2.5.h,
              right: 4.4.w,
              left: 4.4.w,
              child: ValueListenableBuilder(
                valueListenable: _isCustomerContainerVisible,
                builder: (context, value, child) =>
                    CustomerInfoAnimatedContainer(
                        isVisible: _isCustomerContainerVisible,
                        onBackPressed: () {
                          _isCustomerContainerVisible.value = false;

                          Future.delayed(
                            const Duration(milliseconds: 450),
                            () {
                              _isHallInfoVisible.value = false;
                              _isHallContainerVisible.value = true;
                            },
                          );
                        },
                        onContinuePressed: () {
                          _isCustomerInfoVisible.value = true;
                          _isCustomerContainerVisible.value = false;
                          Future.delayed(
                            const Duration(milliseconds: 450),
                            () {
                              _isPaymentContainerVisible.value = true;
                            },
                          );
                        }),
              ),
            ),
            Positioned(
              bottom: 2.5.h,
              right: 4.4.w,
              left: 4.4.w,
              child: ValueListenableBuilder(
                valueListenable: _isPaymentContainerVisible,
                builder: (context, value, child) => PaymentAnimatedContainer(
                    isVisible: _isPaymentContainerVisible,
                    onBackPressed: () {
                      _isPaymentContainerVisible.value = false;

                      Future.delayed(
                        const Duration(milliseconds: 450),
                        () {
                          _isCustomerInfoVisible.value = false;
                          _isCustomerContainerVisible.value = true;
                        },
                      );
                    },
                    onContinuePressed: () {
                      Navigator.pushNamed(context, ConfirmDetailPage.id);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
