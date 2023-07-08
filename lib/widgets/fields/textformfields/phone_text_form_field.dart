import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class PhoneTextFormField extends StatefulWidget {
  const PhoneTextFormField(
      {super.key,
      required this.color,
      required this.pageMode,
      this.phoneController,
      this.validator,
      this.orientation});

  final Color color;
  final PageMode pageMode;
  final TextEditingController? phoneController;
  final String? Function(String?)? validator;
  final Orientation? orientation;

  @override
  State<PhoneTextFormField> createState() => _PhoneTextFormFieldState();
}

class _PhoneTextFormFieldState extends State<PhoneTextFormField> {
  Color? color;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  ValueNotifier<bool> isFocused = ValueNotifier<bool>(false);
  String? _errorText; // Track the error text
  bool _hasError = false; // Track if there is an error

  @override
  Widget build(BuildContext context) {
    double width = widget.orientation == Orientation.landscape
        ? MediaQuery.sizeOf(context).height
        : MediaQuery.sizeOf(context).width;
    return ValueListenableBuilder(
      valueListenable: isFocused,
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 5.6.h,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 1.w, color: color ?? widget.color),
              ),
            ),
            child: Row(
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  height: 3.8.h,
                  width: 13.w,
                  child: Text(
                    '+20',
                    style: TextStyle(
                        color: widget.pageMode == PageMode.dark
                            ? const Color(0xFFed9526)
                            : Colors.black,
                        fontSize: 14.sp),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: widget.phoneController ?? controller,
                    focusNode: focusNode,
                    // textAlignVertical: (_hasError)
                    //     ? TextAlignVertical.bottom
                    //     : TextAlignVertical.center,
                    validator: (value) {
                      if (widget.validator != null) {
                        final error = widget.validator!(value);
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
                          color = widget.pageMode == PageMode.dark
                              ? const Color(0xFF95c0f9)
                              : const Color(0xFF1370EB);
                        } else {
                          color = widget.pageMode == PageMode.dark
                              ? Colors.white
                              : Colors.black;
                        }
                      });
                    },
                    keyboardType: TextInputType.phone,
                    showCursor: false,
                    style: TextStyle(color: widget.color, fontSize: 14.sp),
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.transparent),
                      contentPadding: isFocused.value
                          ? (_hasError)
                              ? EdgeInsets.only(bottom: 0.h)
                              : EdgeInsets.only(bottom: 2.h)
                          : (_hasError)
                              ? EdgeInsets.only(
                                  bottom: width < 600 ? 0.75.h : -1.5.h)
                              : EdgeInsets.only(
                                  bottom: width < 600 ? 1.h : 0.25.h),
                      border: InputBorder.none,
                      label: value
                          ? Transform.translate(
                              offset: Offset(-18.5.w, -2.h),
                              child: Text(
                                'Phone number',
                                style: TextStyle(
                                  color: color ?? widget.color,
                                  fontSize: 12.sp,
                                ),
                              ),
                            )
                          : ((widget.phoneController ?? controller)
                                  .text
                                  .isEmpty)
                              ? Align(
                                  alignment: (_hasError)
                                      ? Alignment.bottomLeft
                                      : Alignment.centerLeft,
                                  child: Text(
                                    'Phone number',
                                    style: TextStyle(
                                      color: color ?? widget.color,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                )
                              : null,
                    ),
                  ),
                ),
              ],
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
