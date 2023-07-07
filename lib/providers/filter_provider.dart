import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  String? _selectedCountry, _selectedCity, _rate;
  RangeValues? _priceRange;
  List<String> _categories = ['All'];
  DateTime? _date;

  DateTime? get date => _date;

  String? get selectedCountry => _selectedCountry;

  String? get selectedCity => _selectedCity;

  String? get rate => _rate;

  RangeValues? get priceRange => _priceRange;

  List<String> get categories => _categories;

  void setDate(DateTime? date) {
    _date = date;
  }

  void changeCountry(String? value) {
    if (value != _selectedCountry) _selectedCity = null;
    _selectedCountry = value;
    notifyListeners();
  }

  void changeCity(String? value) {
    _selectedCity = value;
    notifyListeners();
  }

  void setRange(RangeValues? priceRange) {
    _priceRange = priceRange;
  }

  void setRate(String? rate) {
    _rate = rate;
  }

  void setCategories(List<String> categories) {
    _categories = categories;
  }

  void reset() {
    _date = null;
    _selectedCountry = null;
    _selectedCity = null;
    _priceRange = null;
    _rate = null;
    _categories = ['All'];
    notifyListeners();
  }
}
