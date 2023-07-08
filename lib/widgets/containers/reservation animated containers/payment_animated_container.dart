import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/widgets/fields/textformfields/reserve_text_form_field.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/payment_modal_sheet.dart';
import 'package:monasba/widgets/rows/animated_container_buttons.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PaymentAnimatedContainer extends StatefulWidget {
  const PaymentAnimatedContainer(
      {super.key,
      required this.isVisible,
      required this.onBackPressed,
      required this.onContinuePressed});

  final ValueNotifier<bool> isVisible;
  final Function onBackPressed, onContinuePressed;

  @override
  State<PaymentAnimatedContainer> createState() =>
      _PaymentAnimatedContainerState();
}

class _PaymentAnimatedContainerState extends State<PaymentAnimatedContainer> {
  final TextEditingController _creditHolderNameController =
      TextEditingController();
  final TextEditingController _creditNumberController = TextEditingController();
  final TextEditingController _expirationDateController =
      TextEditingController();
  final TextEditingController _securityCodeController = TextEditingController();
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: widget.isVisible.value ? 42.h : 0.h,
      width: 91.1.w,
      padding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 4.4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: darkBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PageTitle(
              title: 'Payment',
              pageMode: PageMode.dark,
              fontSize: 16.sp,
            ),
            SizedBox(height: 0.9.h),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {
                  widget.isVisible.value = false;
                  Future.delayed(
                    const Duration(milliseconds: 450),
                    () {
                      animateModalSheet(
                        PaymentModalSheet(
                            listViewItems: payWith,
                            isVisible: widget.isVisible),
                      );
                    },
                  );
                },
                title: Text(
                  context.read<ReservationCubit>().paymentWay ?? 'Pay with',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                trailing: SvgPicture.asset(
                  'assets/icons/trends/Left.svg',
                  height: 3.8.h,
                  width: 6.7.w,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcATop),
                ),
              ),
            ),
            ReserveTextFormField(
                lable: 'Credit holder name',
                controller: _creditHolderNameController),
            ReserveTextFormField(
                lable: 'Credit Number', controller: _creditNumberController),
            Row(
              children: [
                Expanded(
                  child: ReserveTextFormField(
                      lable: 'Expiration date',
                      controller: _expirationDateController),
                ),
                Expanded(
                  child: ReserveTextFormField(
                      lable: 'Security Code',
                      controller: _securityCodeController),
                ),
              ],
            ),
            SizedBox(height: 0.9.h),
            AnimatedContainerButtons(onBackPressed: () {
              widget.onBackPressed();
            }, onContinuePressed: () {
              context.read<ReservationCubit>().setPaymentInfo(
                    (_creditHolderNameController.text.isNotEmpty)
                        ? _creditHolderNameController.text
                        : null,
                    (_creditNumberController.text.isNotEmpty)
                        ? _creditNumberController.text
                        : null,
                    (_expirationDateController.text.isNotEmpty)
                        ? _expirationDateController.text
                        : null,
                    (_securityCodeController.text.isNotEmpty)
                        ? _securityCodeController.text
                        : null,
                  );
              widget.onContinuePressed();
            }, onClosePressed: () {
              widget.isVisible.value = false;
            }),
          ],
        ),
      ),
    );
  }
}
