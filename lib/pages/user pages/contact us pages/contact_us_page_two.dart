import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/providers/chat_provider.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/fields/textformfields/chat_text_form_field.dart';
import 'package:monasba/widgets/texts/chat_message.dart';
import 'package:provider/provider.dart';

class ContactUsPageTwo extends StatefulWidget {
  const ContactUsPageTwo({super.key});

  static String id = '/page two';

  @override
  State<ContactUsPageTwo> createState() => _ContactUsPageTwoState();
}

class _ContactUsPageTwoState extends State<ContactUsPageTwo> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: lightBackground,
        appBar:
            const AppBarDesign(title: 'Contact us', pageMode: PageMode.light),
        body: Column(
          children: [
            Consumer<ChatProvider>(
              builder: (context, value, child) => Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: value.chats.length,
                  itemBuilder: (context, index) => ChatMessage(
                      textDirection: (value.chats[index]['id'] == 1)
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      msg: value.chats[index]['msg']),
                ),
              ),
            ),
            ChatTextFormField(
              scrollController: scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
