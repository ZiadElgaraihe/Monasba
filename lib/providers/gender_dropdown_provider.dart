import 'package:flutter/material.dart';

class GenderDropDownProvider extends ChangeNotifier {
  String? _gender;

  String? get gender => _gender;

  set gender(String? gender) {
    _gender = gender;
    notifyListeners();
  }
}
