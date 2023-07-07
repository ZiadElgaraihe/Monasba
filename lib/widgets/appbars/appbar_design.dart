import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class AppBarDesign extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDesign({
    super.key,
    this.title,
    required this.pageMode,
    this.actions,
  });

  final PageMode pageMode;
  final String? title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(8.8.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title == null
          ? null
          : Text(
              title!,
              style: TextStyle(
                fontSize: 16.sp,
                letterSpacing: 0.1.sp,
                color: pageMode == PageMode.light ? Colors.black : Colors.white,
              ),
            ),
      leading: Navigator.canPop(context)
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                'assets/icons/trends/Left.svg',
                height: 3.8.h,
                width: 6.7.w,
                colorFilter: ColorFilter.mode(
                    pageMode == PageMode.light ? Colors.black : Colors.white,
                    BlendMode.srcATop),
              ),
            )
          : null,
      actions: actions,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: pageMode == PageMode.light
          ? SystemUiOverlayStyle.dark.copyWith(statusBarColor: lightBackground)
          : SystemUiOverlayStyle.light.copyWith(statusBarColor: darkBackground),
    );
  }
}
