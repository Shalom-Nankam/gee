import 'package:chat_gpt_api/app/model/models.dart';
import 'package:flutter/material.dart';
import 'package:gee/models/app_theme.dart';
import 'package:gee/state_management/search_request.dart';
import 'package:gee/views/home_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeController();
}

class HomeController extends State<HomeScreen> {
  final themeManager = Get.put(AppTheme());
  final searchManager = Get.put(SearchRequest());

  SpeechToText userSpeech = SpeechToText();
  bool speechToTextIsEnabled = false;
  bool isRecordingSpeech = false;
  bool typeSearch = false;
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

  recordSpeech() async {
    await userSpeech.listen(onResult: speechResult);
    setState(() {});
  }

  stopRecordingSpeech() async {
    await userSpeech.stop();
    setState(() {});
  }

  void speechResult(SpeechRecognitionResult result) {
    setState(() {
      convertedSPeechToText = result.recognizedWords;
    });
  }

  useSearchBox() {
    setState(() {
      typeSearch = !typeSearch;
    });
  }

  changeTheme(bool darkTheme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('Theme', !AppTheme.darkMode.value);
    AppTheme.getTheme();
  }

  makeSearch() async {
    Completion response = await searchManager.makeSearch(convertedSPeechToText);
    print(response.choices);
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(this);
  }
}
