import 'package:flutter/material.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/filter%20modal%20bottom%20sheets/filter_home.dart';
import 'package:sizer/sizer.dart';

class OkTextButton extends StatelessWidget {
  const OkTextButton({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
          onPressed: () {
            onPressed();
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
          style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 1.3.h))),
          child: Text('OK',
              style: TextStyle(color: Colors.white, fontSize: 12.sp))),
    );
  }
}
