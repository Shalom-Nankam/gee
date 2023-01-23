import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_to_speech/text_to_speech.dart';

class VoiceResponsePage extends StatefulWidget {
  const VoiceResponsePage({super.key, required this.inputText});
  final String inputText;

  @override
  State<VoiceResponsePage> createState() => _VoiceResponsePageState();
}

class _VoiceResponsePageState extends State<VoiceResponsePage> {
  late TextToSpeech textToSpeech = TextToSpeech();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void speak() {
    textToSpeech.setVolume(1);
    textToSpeech.setRate(1.0);
    textToSpeech.setPitch(1.0);
    textToSpeech.setLanguage("en-US");
    textToSpeech.speak(widget.inputText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Gee AI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
            child: Column(
          children: const [],
        )),
      ),
    );
  }
}
