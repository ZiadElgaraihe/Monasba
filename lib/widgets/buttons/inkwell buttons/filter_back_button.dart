import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/filter%20modal%20bottom%20sheets/filter_home.dart';
import 'package:sizer/sizer.dart';

class FilterBackButton extends StatelessWidget {
  const FilterBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.3.h),
      child: InkWell(
        onTap: () {
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
        },
        child: SvgPicture.asset(
          'assets/icons/trends/Left.svg',
          height: 3.8.h,
          width: 6.7.w,
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcATop),
        ),
      ),
    );
  }
}
