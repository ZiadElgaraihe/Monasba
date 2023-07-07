import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField(
      {super.key,
      required this.title,
      this.passwordController,
      this.validator});

  final String title;
  final TextEditingController? passwordController;
  final String? Function(String?, String)? validator;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  Color color = Colors.white;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  ValueNotifier<bool> isFocused = ValueNotifier<bool>(false);
  bool isVisible = false;
  String? _errorText; // Track the error text
  bool _hasError = false; // Track if there is an error

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isFocused,
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(right: 2.2.w),
            height: 5.6.h,
            decoration: BoxDecoration(
                border: Border(
              left: BorderSide(width: 1.w, color: color),
            )),
            child: TextFormField(
              textAlignVertical: isVisible
                  ? TextAlignVertical.center
                  : TextAlignVertical.bottom,
              controller: widget.passwordController ?? controller,
              focusNode: focusNode,
              validator: (value) {
                if (widget.validator != null) {
                  final error = widget.validator!(value, widget.title);
                  setState(() {
                    _errorText = error; // Set the error text
                    _hasError = error != null; // Set the error flag
                  });
                  return error;
                }
                return null;
              },
              onTap: () {
                focusNode.addListener(() {
                  isFocused.value = focusNode.hasFocus;
                  if (isFocused.value) {
                    color = const Color(0xFF95c0f9);
                  } else {
                    color = Colors.white;
                  }
                });
              },
              showCursor: false,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isVisible ? 14.sp : 16.sp,
                  letterSpacing: isVisible ? 0.75.w : 1.5.w),
              keyboardType: TextInputType.visiblePassword,
              obscuringCharacter: '*',
              obscureText: !isVisible,
              decoration: InputDecoration(
                errorStyle: const TextStyle(color: Colors.transparent),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 3.3.w),
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: isVisible
                      ? SvgPicture.asset(
                          'assets/icons/visibility/visible.svg',
                          colorFilter:
                              ColorFilter.mode(color, BlendMode.srcATop),
                          height: 3.h,
                          width: 6.7.w,
                          fit: BoxFit.cover,
                        )
                      : SvgPicture.asset(
                          'assets/icons/visibility/hide.svg',
                          colorFilter:
                              ColorFilter.mode(color, BlendMode.srcATop),
                          height: 3.h,
                          width: 6.7.w,
                          fit: BoxFit.cover,
                        ),
                ),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                label: value
                    ? Transform.translate(
                        offset: Offset(-5.5.w, -0.90.h),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: color,
                            fontSize: 12.sp,
                            letterSpacing: 0,
                          ),
                        ),
                      )
                    : ((widget.passwordController ?? controller).text.isEmpty)
                        ? Align(
                            alignment: (_hasError)
                                ? Alignment.bottomLeft
                                : Alignment.centerLeft,
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                color: color,
                                fontSize: 14.sp,
                                letterSpacing: 0,
                              ),
                            ),
                          )
                        : null,
              ),
            ),
          ),
          if (widget.validator != null && _hasError)
            Text(
              _errorText ?? '',
              style: TextStyle(
                color: const Color(0xFFffa09e),
                fontSize: 9.sp,
              ),
            ),
        ],
      ),
    );
  }
}