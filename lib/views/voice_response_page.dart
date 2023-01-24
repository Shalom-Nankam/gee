import 'package:chat_gpt_api/app/model/data_model/completion/completion.dart';
import 'package:flutter/material.dart';
import 'package:gee/state_management/search_request.dart';
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
  late Future<Completion> searchResponse;

  final searchManager = Get.put(SearchRequest());

  @override
  void initState() {
    // TODO: implement initState
    searchResponse = searchManager.makeSearch(widget.inputText);
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
          children: [
            Text(
              widget.inputText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: searchResponse,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Text(
                    snapshot.data!.choices != null
                        ? snapshot.data!.choices![0].text!
                        : '',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  );
                  textToSpeech.speak(snapshot.data!.choices![0].text!);
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        )),
      ),
    );
  }
}
