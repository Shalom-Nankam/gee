import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gee/controllers/home_controller.dart';
import 'package:gee/models/app_theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme.getTheme();
  initialization();

  runApp(MyApp());
}

initialization() {
  sleep(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeManager = Get.put(AppTheme());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.setAppTheme(),
          darkTheme: AppTheme.setAppTheme(),
          themeMode: AppTheme.darkMode.value ? ThemeMode.dark : ThemeMode.light,
          title: 'Gee App',
          home: const HomeScreen()),
    );
  }
}
