import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key, required this.orientation});

  final Orientation orientation;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isExpanded = false;
  final ValueNotifier<bool> _containText = ValueNotifier<bool>(false);
  final TextEditingController _controller = TextEditingController();
  late double width, height;

  double getRaduis(
      {required double phoneRaduis, required double tabletRaduis}) {
    if (widget.orientation == Orientation.portrait) {
      if (width < 600) {
        return phoneRaduis;
      } else {
        return tabletRaduis;
      }
    } else {
      if (height < 600) {
        return phoneRaduis;
      } else {
        return tabletRaduis;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    width = size.width;
    height = size.height;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: _isExpanded ? 73.3.w : 13.3.w,
      height: 7.5.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: darkBackground,
        borderRadius: _isExpanded
            ? BorderRadius.horizontal(
                left: Radius.circular(
                    getRaduis(phoneRaduis: 30, tabletRaduis: 50)),
                right: Radius.circular(
                    getRaduis(phoneRaduis: 15, tabletRaduis: 30)))
            : BorderRadius.circular(
                getRaduis(phoneRaduis: 15, tabletRaduis: 30)),
      ),
      padding: const EdgeInsets.all(10.0),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = true;
          });
        },
        child: _isExpanded
            ? TextField(
                controller: _controller,
                onChanged: (value) {
                  if (_controller.text.isNotEmpty) {
                    _containText.value = true;
                  } else {
                    _containText.value = false;
                  }
                },
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                  prefixIcon: IconButton(
                    onPressed: null,
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset('assets/icons/search.svg',
                        height: 3.8.h),
                  ),
                  suffixIcon: ValueListenableBuilder(
                    valueListenable: _containText,
                    builder: (context, value, child) => IconButton(
                      onPressed: () {
                        if (value) {
                          _controller.text = '';
                          _containText.value = false;
                        } else {
                          _isExpanded = false;
                          setState(() {});
                        }
                      },
                      padding: EdgeInsets.zero,
                      icon: SvgPicture.asset(
                        value
                            ? 'assets/icons/map/close_round_fill.svg'
                            : 'assets/icons/trends/Right.svg',
                        height: 3.8.h,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcATop),
                      ),
                    ),
                  ),
                ),
              )
            : Center(
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  height: 5.h,
                  width: 8.9.h,
                ),
              ),
      ),
    );
  }
}
