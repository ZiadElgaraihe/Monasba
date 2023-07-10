import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class IsSavedContainer extends StatefulWidget {
  const IsSavedContainer(
      {super.key, required this.onTap, required this.isSaved});

  final bool isSaved;
  final Function onTap;

  @override
  State<IsSavedContainer> createState() => _IsSavedContainerState();
}

class _IsSavedContainerState extends State<IsSavedContainer> {
  final ValueNotifier<bool> _isSaved = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _isSaved.value = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        _isSaved.value = !_isSaved.value;
      },
      child: Container(
        width: 8.3.w,
        height: 4.7.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF343434),
        ),
        child: Padding(
          padding: EdgeInsets.all(0.5.h),
          child: ValueListenableBuilder(
            valueListenable: _isSaved,
            builder: (context, value, child) => SvgPicture.asset(
              value
                  ? 'assets/icons/bookmarks/bookmark_fill_active.svg'
                  : 'assets/icons/bookmarks/bookmark_fill.svg',
            ),
          ),
        ),
      ),
    );
  }
}
