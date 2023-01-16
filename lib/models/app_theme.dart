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
    return ThemeData(
        iconTheme: IconThemeData(
            color: darkMode ? const Color(0xff000000) : const Color(0xffffffff),
            size: 50),
        scaffoldBackgroundColor:
            darkMode ? const Color(0xff000000) : const Color(0xffffffff),
        appBarTheme: AppBarTheme(
            backgroundColor:
                darkMode ? const Color(0xff000000) : const Color(0xffffffff),
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
                color: darkMode
                    ? const Color(0xff000000)
                    : const Color(0xffffffff),
                size: 30)),
        textTheme: TextTheme(
            button: TextStyle(
          color: darkMode ? const Color(0xff000000) : const Color(0xffffffff),
        )),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:
              darkMode ? const Color(0xff000000) : const Color(0xffffffff),
        ));
  }
}
