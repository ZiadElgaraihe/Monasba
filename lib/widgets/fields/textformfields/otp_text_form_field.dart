import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OtpTextFormField extends StatefulWidget {
  const OtpTextFormField({super.key});

  @override
  State<OtpTextFormField> createState() => _OtpTextFormFieldState();
}

class _OtpTextFormFieldState extends State<OtpTextFormField> {
  List colors = List.generate(
      4,
      (index) => {
            'background color': const Color(0xFFb0b0b0),
            'text color': Colors.white
          });

  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  List<ValueNotifier<bool>> isFocused =
      List.generate(4, (index) => ValueNotifier<bool>(false));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
        (index) => ValueListenableBuilder(
          valueListenable: isFocused[index],
          builder: (context, value, child) => Container(
            decoration: BoxDecoration(
                color: colors[index]['background color'],
                borderRadius: BorderRadius.circular(7.5)),
            height: 8.8.h,
            width: 15.6.w,
            child: TextFormField(
              controller: controllers[index],
              maxLength: 1,
              focusNode: focusNodes[index],
              onTap: () {
                focusNodes[index].addListener(() {
                  isFocused[index].value = focusNodes[index].hasFocus;
                  if (isFocused[index].value) {
                    colors[index]['background color'] = const Color(0xFFb0b0b0);
                    colors[index]['text color'] = Colors.white;
                  } else {
                    if (controllers[index].value.text.isNotEmpty) {
                      colors[index]['background color'] = Colors.white;
                      colors[index]['text color'] = Colors.black;
                    }
                  }
                });
              },
              onChanged: (value) {
                if (value.length == 1 && index <= 3) {
                  if (index != 3) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                  colors[index]['background color'] = Colors.white;
                  colors[index]['text color'] = Colors.black;
                } else if (value.isEmpty && index >= 0) {
                  if (index != 0) {
                    colors[index - 1]['background color'] =
                        const Color(0xFFb0b0b0);
                    colors[index - 1]['text color'] = Colors.white;
                    FocusScope.of(context).previousFocus();
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                }
                setState(() {});
              },
              style: TextStyle(
                decoration: (colors[index]['background color'] ==
                        const Color(0xFFb0b0b0))
                    ? TextDecoration.underline
                    : null,
                color: colors[index]['text color'],
                fontSize: 26.sp,
              ),
              showCursor: false,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.5, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
