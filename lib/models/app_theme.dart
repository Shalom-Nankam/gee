import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  static bool darkMode = false;
  static getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    darkMode = prefs.getBool('Theme') ?? false;
  }

  static ThemeData setAppTheme() {
    AppTheme.getTheme();
    return ThemeData();
  }
}
