import 'package:flutter/material.dart';

class LocationDropDownProvider extends ChangeNotifier {
  String? _selectedCity;

  String? get selectedCity => _selectedCity;

  void changeCity(String? value) {
    _selectedCity = value;
    notifyListeners();
  }
}
