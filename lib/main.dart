import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gee/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialization();

  runApp(const MyApp());
}

initialization() {
  sleep(const Duration(seconds: 5));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        darkTheme: ThemeData(useMaterial3: true),
        title: 'Material App',
        home: const Home());
  }
}
