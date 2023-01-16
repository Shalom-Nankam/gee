import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends GetxController {
  static var darkMode = false.obs;
  static getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    darkMode(prefs.getBool('Theme') ?? false);
  }

  static ThemeData setAppTheme() {
    AppTheme.getTheme();
    return ThemeData(
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: darkMode.value
                    ? const MaterialStatePropertyAll(Color(0xff000000))
                    : const MaterialStatePropertyAll(Color(0xffffffff)))),
        useMaterial3: true,
        iconTheme: IconThemeData(
            color: darkMode.value
                ? const Color(0xffffffff)
                : const Color(0xff000000),
            size: 50),
        scaffoldBackgroundColor:
            darkMode.value ? const Color(0xff000000) : const Color(0xffffffff),
        appBarTheme: AppBarTheme(
            backgroundColor: darkMode.value
                ? const Color(0xff000000)
                : const Color(0xffffffff),
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
                color: darkMode.value
                    ? const Color(0xffffffff)
                    : const Color(0xff000000),
                size: 30)),
        textTheme: TextTheme(
            button: TextStyle(
          color: darkMode.value
              ? const Color(0xffffffff)
              : const Color(0xff000000),
        )),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: darkMode.value
              ? const Color(0xffffffff)
              : const Color(0xff000000),
        ));
  }
}
