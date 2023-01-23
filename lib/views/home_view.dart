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
    return GestureDetector(
      onTap: () {
        FocusNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Gee AI',
          ),
          actions: [
            Obx(
              () => IconButton(
                  onPressed: () =>
                      controller.changeTheme(AppTheme.darkMode.value),
                  icon: AppTheme.darkMode.value
                      ? const Icon(Icons.wb_sunny)
                      : const Icon(Icons.dark_mode_outlined)),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
              child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: controller.typeSearch
                      ? TypeSearch(
                          control: controller,
                        )
                      : RecordSearch(controller: controller))),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Obx(
            () => FloatingActionButton.extended(
              // backgroundColor: const Color(0xff000000),
              onPressed: () => controller.useSearchBox(),
              label: controller.typeSearch
                  ? Icon(
                      Icons.mic,
                      size: 30,
                      color: AppTheme.darkMode.value
                          ? const Color(0xff000000)
                          : const Color(0xffffffff),
                    )
                  : Icon(
                      Icons.edit_note,
                      size: 30,
                      color: AppTheme.darkMode.value
                          ? const Color(0xff000000)
                          : const Color(0xffffffff),
                    ),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }
}

class TypeSearch extends StatelessWidget {
  const TypeSearch({
    Key? key,
    required this.control,
  }) : super(key: key);

  final HomeController control;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => control.searchManager.isSearching.value
          ? Column(
              children: const [
                Center(child: CircularProgressIndicator()),
              ],
            )
          : Column(
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
                  child: TextField(
                    controller: control.typedSearch,
                    decoration: const InputDecoration(border: InputBorder.none),
                    expands: true,
                    maxLines: null,
                    minLines: null,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                SearchButton(
                  pressAction: () =>
                      control.makeSearch(control.typedSearch.text),
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
      () => controller.searchManager.isSearching.value
          ? Column(
              children: const [
                Center(child: CircularProgressIndicator()),
              ],
            )
          : Column(
              children: [
                const SizedBox(
                  height: 10,
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
                  height: 20,
                ),
                if (controller.userSpeech.isListening)
                  SizedBox(
                      height: 200,
                      child: Obx(
                        () => Text(
                          controller.searchManager.searchQuery.value,
                        ),
                      )),
                SizedBox(
                  height: 200,
                  width: 200,
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
                  pressAction: () =>
                      controller.makeSearch(controller.convertedSPeechToText),
                )
              ],
            ),
    );
  }
}
