import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  static bool themeMode = false;
  static getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    themeMode = prefs.getBool('Theme') ?? false;
  }

  static ThemeData setAppTheme() {
    AppTheme.getTheme();
    return ThemeData();
  }
}
