import 'package:flutter/material.dart';

///This is the class which effects the MVC architecture pattern
///It separates the business logic(controller) from the presentation
///logic (view)
abstract class StatelessView<T1, T2> extends StatelessWidget {
  const StatelessView(
    this.controller, {
    Key? key,
  }) : super(key: key);
  final T2 controller;
  T1 get widget => (controller as State).widget as T1;

  @override
  Widget build(BuildContext context);
}
