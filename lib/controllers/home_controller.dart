import 'package:flutter/material.dart';
import 'package:gee/views/home_view.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeController();
}

class HomeController extends State<HomeScreen> {
  SpeechToText userSpeech = SpeechToText();
  bool speechToTextIsEnabled = false;
  bool isRecordingSpeech = false;
  String convertedSPeechToText = '';
  String recordInstruction = 'Tap the button to begin recording';
  String stopRecordInstruction = 'Tap the button when done speaking';

  @override
  void initState() {
    initializeSPeechToText();
    super.initState();
  }

  void initializeSPeechToText() async {
    speechToTextIsEnabled = await userSpeech.initialize();
    setState(() {});
  }

  void recordSpeech() async {
    await userSpeech.listen(onResult: speechResult);
    setState(() {
      isRecordingSpeech = true;
    });
  }

  void stopRecordingSpeech() async {
    await userSpeech.stop();
    setState(() {
      isRecordingSpeech = false;
    });
  }

  void speechResult(SpeechRecognitionResult result) {
    setState(() {
      convertedSPeechToText = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(this);
  }
}
