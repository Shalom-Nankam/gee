import 'package:flutter/material.dart';
import 'package:gee/controllers/home_controller.dart';
import 'package:gee/views/statelessview.dart';
import 'package:gee/widgets/record_speech_button.dart';

class HomeView extends StatelessView<HomeScreen, HomeController> {
  const HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gee AI',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.wb_sunny))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Text(
                  controller.isRecordingSpeech
                      ? controller.stopRecordInstruction
                      : controller.recordInstruction,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000))),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: controller.isRecordingSpeech
                    ? const RecordSpeechButton(toRecord: false)
                    : const RecordSpeechButton(toRecord: true),
              )
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff000000),
        onPressed: () {},
        label: const Icon(
          Icons.edit_note,
          size: 30,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
