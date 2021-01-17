import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference extends ChangeNotifier {
  static const THEME_STATUS = "THEME_STATUS";

  bool _value = false;

  get value => _value;

  void getThemeStatus() {
    SharedPreferences.getInstance()
        .then((prefs) => _value = prefs.getBool(THEME_STATUS) ?? false);
    notifyListeners();
  }

  set value(value) {
    _value = value;
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setBool(THEME_STATUS, value));
    notifyListeners();
  }
}
