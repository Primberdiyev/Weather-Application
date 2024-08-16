import 'package:flutter/material.dart';
import 'package:weather_application/search_country_page/county_model.dart';
import 'package:weather_application/search_country_page/get_country.dart';
import 'dart:async';

class CountryProvider with ChangeNotifier {
  List<CountyModel> _allCountries = [];
  List<CountyModel> _filteredCountries = [];
  Timer? _debounce;
  bool isLoading = false;
  List<CountyModel> get filteredCountries => _filteredCountries;

  Future<void> fetchCountries() async {
    final countries = await GetCountry().getCountries();
    _allCountries = countries;
    _filteredCountries = countries;
    notifyListeners();
  }

  void onsearchanged(String enteredKeyWord) {

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    isLoading=true;
    notifyListeners();
    _debounce = Timer(const Duration(seconds: 2), () {
      if (enteredKeyWord.isNotEmpty) {
        _filteredCountries = _allCountries
            .where((country) => country.name!
                .toLowerCase()
                .contains(enteredKeyWord.toLowerCase()))
            .toList();
      } else {
        _filteredCountries = _allCountries;
      }
      isLoading=false;
      notifyListeners();
    });
  }
}
