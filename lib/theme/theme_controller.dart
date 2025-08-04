import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/theme/theme.dart';

class ThemeController extends GetxController {
  // initially, theme is light mode
  ThemeData _themeData = lightMode;

  // getter method to access the theme from other parts of the code
  ThemeData get themeData => _themeData;

  // getter method to see if we are in dark mode or not
  bool get isDarkMode => _themeData == darkMode;

  // setter method to set new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    update();
  }

  // we will use this toggle in switch later on..
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
