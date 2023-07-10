import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class NavigateButton extends StatefulWidget {
  const NavigateButton({super.key});

  @override
  State<NavigateButton> createState() => _NavigateButtonState();
}

class _NavigateButtonState extends State<NavigateButton> {
  final ValueNotifier<bool> _isNavigateOn = ValueNotifier<bool>(false);
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isNavigateOn,
      builder: (context, value, child) => SizedBox(
        height: 6.6.h,
        width: 11.7.w,
        child: FloatingActionButton(
            backgroundColor: value ? lightBackground : darkBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: SvgPicture.asset(
              value
                  ? 'assets/icons/map/navigate_fill.svg'
                  : 'assets/icons/map/navigate.svg',
              height: 4.4.h,
              width: 7.8.w,
            ),
            onPressed: () {
              _isNavigateOn.value = !_isNavigateOn.value;
            }),
      ),
    );
  }
}
