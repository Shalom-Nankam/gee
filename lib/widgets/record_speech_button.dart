import 'package:flutter/material.dart';
import 'package:gee/models/app_theme.dart';

class RecordSpeechButton extends StatelessWidget {
  const RecordSpeechButton(
      {super.key, required this.toRecord, required this.pressAction});
  final bool toRecord;
  final VoidCallback pressAction;

  @override
  Widget build(BuildContext context) {
    //Tne button the user presses to begin recording their speech
    return Container(
      height: 150,
      width: 250,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: AppTheme.darkMode.value
                  ? const Color(0xffffffff)
                  : const Color(0xff000000),
              width: 2)),
      child: IconButton(
          onPressed: pressAction,

          //show an icon depending on whether the user is currently
          //making a record or not
          icon: toRecord
              ? const Icon(
                  Icons.mic,
                  size: 100,
                )
              : const Icon(
                  Icons.stop,
                  size: 100,
                )),
    );
  }
}
