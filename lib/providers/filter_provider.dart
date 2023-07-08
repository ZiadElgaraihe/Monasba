import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  String? _selectedCity, _rate;
  RangeValues? _priceRange;
  List<String> _categories = ['All'];
  DateTime? _date;

  DateTime? get date => _date;

  String? get selectedCity => _selectedCity;

  String? get rate => _rate;

  RangeValues? get priceRange => _priceRange;

  List<String> get categories => _categories;

  void setDate(DateTime? date) {
    _date = date;
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
    _selectedCity = null;
    _priceRange = null;
    _rate = null;
    _categories = ['All'];
    notifyListeners();
  }
}
