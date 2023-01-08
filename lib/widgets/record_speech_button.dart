import 'package:flutter/material.dart';

class RecordSpeechButton extends StatelessWidget {
  const RecordSpeechButton({super.key, required this.toRecord});
  final bool toRecord;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: const Color(0xff000000), width: 2)),
      child: IconButton(
          onPressed: () {},
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
