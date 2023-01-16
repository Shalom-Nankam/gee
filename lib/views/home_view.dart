import 'package:flutter/material.dart';
import 'package:gee/controllers/home_controller.dart';
import 'package:gee/models/app_theme.dart';
import 'package:gee/views/statelessview.dart';
import 'package:gee/widgets/search_button.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../widgets/record_speech_button.dart';

class HomeView extends StatelessView<HomeScreen, HomeController> {
  const HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gee AI',
          // style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () => controller.changeTheme(AppTheme.darkMode.value),
              icon: const Icon(Icons.wb_sunny))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
            child: SingleChildScrollView(
                child: controller.typeSearch
                    ? const TypeSearch()
                    : RecordSearch(controller: controller))),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton.extended(
          // backgroundColor: const Color(0xff000000),
          onPressed: () => controller.useSearchBox(),
          label: controller.typeSearch
              ? const Icon(
                  Icons.mic,
                  size: 30,
                )
              : const Icon(
                  Icons.edit_note,
                  size: 30,
                ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

class TypeSearch extends StatelessWidget {
  const TypeSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Text('Type your search text in the box below',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkMode.value
                      ? const Color(0xffffffff)
                      : const Color(0xff000000))),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color: AppTheme.darkMode.value
                        ? const Color(0xffffffff)
                        : const Color(0xff000000)))),
            child: const TextField(
              decoration: InputDecoration(border: InputBorder.none),
              expands: true,
              maxLines: null,
              minLines: null,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          SearchButton(
            pressAction: () {},
          )
        ],
      ),
    );
  }
}

class RecordSearch extends StatelessWidget {
  const RecordSearch({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Text(
              controller.userSpeech.isListening
                  ? controller.stopRecordInstruction
                  : controller.recordInstruction,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkMode.value
                      ? const Color(0xffffffff)
                      : const Color(0xff000000))),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 200,
            width: 300,
            child: controller.userSpeech.isListening
                ? RecordSpeechButton(
                    toRecord: false,
                    pressAction: () => controller.stopRecordingSpeech(),
                  )
                : RecordSpeechButton(
                    toRecord: true,
                    pressAction: () => controller.recordSpeech(),
                  ),
          ),
          const SizedBox(
            height: 80,
          ),
          SearchButton(
            pressAction: () {},
          )
        ],
      ),
    );
  }
}
