import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';

class LocationDropDownProvider extends ChangeNotifier {
  String? _selectedCountry, _selectedCity, _countryCode;

  String? get selectedCountry => _selectedCountry;

  String? get selectedCity => _selectedCity;

  String? get countryCode => _countryCode;

  void changeCountry(String? value) {
    if (value != _selectedCountry) _selectedCity = null;
    _countryCode = locationData[value]!['code'];
    _selectedCountry = value;
    notifyListeners();
  }

  void changeCity(String? value) {
    _selectedCity = value;
    notifyListeners();
  }
}
