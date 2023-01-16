import 'package:flutter/material.dart';

import '../models/app_theme.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.pressAction});
  final VoidCallback pressAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: OutlinedButton(
          // style: ButtonStyle(
          //     backgroundColor:
          //         MaterialStateProperty.all(const Color(0xff000000))),
          onPressed: pressAction,
          child: Text(
            'Go',
            style: TextStyle(
                color: AppTheme.darkMode
                    ? const Color(0xffffffff)
                    : const Color(0xff000000),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )),
    );
  }
}
