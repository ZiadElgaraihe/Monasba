import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReserveTextFormField extends StatefulWidget {
  const ReserveTextFormField(
      {super.key, required this.lable, required this.controller});

  final String lable;
  final TextEditingController controller;

  @override
  State<ReserveTextFormField> createState() => _ReserveTextFormFieldState();
}

class _ReserveTextFormFieldState extends State<ReserveTextFormField> {
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isFocused = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isFocused,
      builder: (context, value, child) => TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        onTap: () {
          _focusNode.addListener(() {
            _isFocused.value = _focusNode.hasFocus;
          });
        },
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          icon: const SizedBox(),
          border: InputBorder.none,
          label: _focusNode.hasFocus
              ? Transform.translate(
                  offset: Offset(-5.5.w, -0.90.h),
                  child: Text(
                    widget.lable,
                    style: TextStyle(
                      color: const Color(0xFF95c0f9),
                      fontSize: 12.sp,
                    ),
                  ),
                )
              : Text(
                  widget.lable,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
        ),
      ),
    );
  }
}
