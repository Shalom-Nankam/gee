import 'package:flutter/material.dart';
import 'package:gee/state_management/search_request.dart';
import 'package:get/get.dart';
import 'package:text_to_speech/text_to_speech.dart';

class VoiceResponsePage extends StatefulWidget {
  const VoiceResponsePage(
      {super.key, required this.request, required this.response});
  final String request;
  final String response;

  @override
  State<VoiceResponsePage> createState() => _VoiceResponsePageState();
}

class _VoiceResponsePageState extends State<VoiceResponsePage> {
  late TextToSpeech textToSpeech = TextToSpeech();
  // late Future<Completion?> searchResponse;

  final searchManager = Get.put(SearchRequest());

  void speak() {
    textToSpeech.setVolume(1);
    textToSpeech.setRate(1.0);
    textToSpeech.setPitch(1.0);
    textToSpeech.setLanguage("en-US");
    textToSpeech.speak(widget.response);
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.request,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.response,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
