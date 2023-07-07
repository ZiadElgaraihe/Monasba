import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monasba/constants.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({super.key, required this.pageMode});

  final PageMode pageMode;

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 0,
      elevation: 0,
      systemOverlayStyle: pageMode == PageMode.light
          ? SystemUiOverlayStyle.dark.copyWith(statusBarColor: lightBackground)
          : SystemUiOverlayStyle.light.copyWith(statusBarColor: darkBackground),
    );
  }
}
