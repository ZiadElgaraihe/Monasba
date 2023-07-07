import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.hasNotifications,
    this.titleColor,
  });

  final String title, icon;
  final Function onTap;
  final bool hasNotifications;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: SizedBox(
          height: 7.5.h,
          width: double.infinity,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                height: 3.1.h,
                width: 5.6.w,
              ),
              SizedBox(width: 4.2.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: titleColor ?? const Color(0xFF414141),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              hasNotifications
                  ? Container(
                      width: 8.9.w,
                      height: 5.h,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFb3261e),
                      ),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
