import 'package:flutter/material.dart';

//This provider is used only for design
class ChatProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _chats = [
    {'id': 1, 'msg': 'Hello'},
    {'id': 2, 'msg': 'Hello'},
    {'id': 2, 'msg': 'How can I help you sir'},
    {'id': 1, 'msg': 'I want to ask about something'},
  ];

  void addToChats(String msg) {
    _chats.add({'id': 2, 'msg': msg});
    notifyListeners();
  }

  List<Map<String, dynamic>> get chats => _chats;
}
