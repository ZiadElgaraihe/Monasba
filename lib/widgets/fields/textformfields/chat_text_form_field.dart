import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/providers/chat_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChatTextFormField extends StatefulWidget {
  const ChatTextFormField({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<ChatTextFormField> createState() => _ChatTextFormFieldState();
}

class _ChatTextFormFieldState extends State<ChatTextFormField> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) => Container(
        margin: EdgeInsets.only(bottom: 0.1.h),
        padding: EdgeInsets.only(right: 3.8.w),
        decoration: BoxDecoration(
            color: value ? Colors.white : Colors.black,
            border: Border.all(color: Colors.black, width: 0.5.w),
            borderRadius: BorderRadius.circular(30)),
        child: TextField(
          onTap: () {
            focusNode.addListener(() {
              if (controller.text.isEmpty) {
                valueNotifier.value = focusNode.hasFocus;
              } else {
                valueNotifier.value = true;
              }
            });
          },
          focusNode: focusNode,
          controller: controller,
          cursorColor: Colors.black,
          cursorWidth: 0.3.w,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
          decoration: InputDecoration(
            suffixIcon: Material(
              color: Colors.transparent,
              child: value
                  ? IconButton(
                      onPressed: () async {
                        if (controller.text.isNotEmpty) {
                          Provider.of<ChatProvider>(context, listen: false)
                              .addToChats(controller.text);
                          controller.text = '';
                          await Future.delayed(
                              const Duration(milliseconds: 500));
                          widget.scrollController.jumpTo(
                              widget.scrollController.position.maxScrollExtent);
                        }
                      },
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                      icon: SvgPicture.asset(
                        'assets/icons/chat icons/send.svg',
                        height: 3.5.h,
                        width: 3.1.w,
                        fit: BoxFit.cover,
                      ),
                    )
                  : IconButton(
                      onPressed: () {},
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      icon: SvgPicture.asset(
                        'assets/icons/chat icons/voice.svg',
                        height: 3.5.h,
                        width: 3.1.w,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            hintText: 'Send a message',
            hintStyle: TextStyle(color: value ? Colors.black : Colors.white),
            contentPadding:
                EdgeInsets.symmetric(vertical: 3.5.h, horizontal: 6.7.w),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
