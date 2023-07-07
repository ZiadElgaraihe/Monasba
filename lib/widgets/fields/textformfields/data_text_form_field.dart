import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:sizer/sizer.dart';

class DataTextFormField extends StatefulWidget {
  const DataTextFormField({
    Key? key,
    required this.width,
    required this.title,
    required this.keyboardType,
    required this.pageMode,
    this.dataController,
    this.validator,
  }) : super(key: key);

  final PageMode pageMode;
  final TextInputType keyboardType;
  final String title;
  final double width;
  final TextEditingController? dataController;
  final String? Function(String?, String)? validator;

  @override
  State<DataTextFormField> createState() => _DataTextFormFieldState();
}

class _DataTextFormFieldState extends State<DataTextFormField> {
  Color? color;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  ValueNotifier<bool> isFocused = ValueNotifier<bool>(false);
  String? _errorText; // Track the error text
  bool _hasError = false; // Track if there is an error

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isFocused,
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 5.6.h,
            width: widget.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1.w,
                  color: (color != null)
                      ? color!
                      : (widget.pageMode == PageMode.dark)
                          ? Colors.white
                          : Colors.black,
                ),
              ),
            ),
            child: TextFormField(
              controller: widget.dataController ?? controller,
              focusNode: focusNode,
              textAlignVertical: (_hasError)
                  ? TextAlignVertical.bottom
                  : TextAlignVertical.center,
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
              keyboardType: widget.keyboardType,
              showCursor: false,
              style: TextStyle(
                color: widget.pageMode == PageMode.dark
                    ? Colors.white
                    : Colors.black,
                fontSize: 14.sp,
              ),
              decoration: InputDecoration(
                errorStyle: const TextStyle(color: Colors.transparent),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 3.3.w),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                label: focusNode.hasFocus
                    ? Transform.translate(
                        offset: Offset(-5.5.w, -0.90.h),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: widget.pageMode == PageMode.dark
                                ? const Color(0xFF95c0f9)
                                : const Color(0xFF1370EB),
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    : ((widget.dataController ?? controller).text.isEmpty)
                        ? Align(
                            alignment: (_hasError)
                                ? Alignment.bottomLeft
                                : Alignment.centerLeft,
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                color: widget.pageMode == PageMode.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14.sp,
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