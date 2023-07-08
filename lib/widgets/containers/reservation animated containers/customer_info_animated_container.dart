import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/widgets/fields/textformfields/reserve_text_form_field.dart';
import 'package:monasba/widgets/rows/animated_container_buttons.dart';
import 'package:monasba/widgets/rows/phone_number_row.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CustomerInfoAnimatedContainer extends StatefulWidget {
  const CustomerInfoAnimatedContainer(
      {super.key,
      required this.isVisible,
      required this.onBackPressed,
      required this.onContinuePressed});

  final ValueNotifier<bool> isVisible;
  final Function onBackPressed, onContinuePressed;

  @override
  State<CustomerInfoAnimatedContainer> createState() =>
      _CustomerInfoAnimatedContainerState();
}

class _CustomerInfoAnimatedContainerState
    extends State<CustomerInfoAnimatedContainer> {
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _customerIdController = TextEditingController();
  final TextEditingController _guarantorNameController =
      TextEditingController();
  final TextEditingController _guarantorIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: widget.isVisible.value ? 48.6.h : 0.h,
      width: 91.1.w,
      padding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 4.4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: darkBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            PageTitle(
              title: 'Customer Info',
              pageMode: PageMode.dark,
              fontSize: 16.sp,
            ),
            SizedBox(height: 1.8.h),
            ReserveTextFormField(
                lable: 'Customer Name', controller: _customerNameController),
            ReserveTextFormField(
                lable: 'Customer ID', controller: _customerIdController),
            SizedBox(height: 1.1.h),
            const PhoneNumberRow(pageMode: PageMode.dark),
            SizedBox(height: 1.1.h),
            ReserveTextFormField(
                lable: 'Guarantor Name', controller: _guarantorNameController),
            ReserveTextFormField(
                lable: 'Guarantor ID', controller: _guarantorIdController),
            SizedBox(height: 1.8.h),
            AnimatedContainerButtons(onClosePressed: () {
              widget.isVisible.value = false;
            }, onBackPressed: () {
              widget.onBackPressed();
            }, onContinuePressed: () {
              context.read<ReservationCubit>().setCustomerInfo(
                    (_customerNameController.text.isNotEmpty)
                        ? _customerNameController.text
                        : null,
                    (_customerIdController.text.isNotEmpty)
                        ? _customerIdController.text
                        : null,
                    (_guarantorNameController.text.isNotEmpty)
                        ? _guarantorNameController.text
                        : null,
                    (_guarantorIdController.text.isNotEmpty)
                        ? _guarantorIdController.text
                        : null,
                  );
              widget.onContinuePressed();
            })
          ],
        ),
      ),
    );
  }
}
