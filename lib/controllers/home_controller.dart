import 'package:flutter/material.dart';
import 'package:gee/views/home_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeController();
}

class HomeController extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeView(this);
  }
}
