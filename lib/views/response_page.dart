import 'package:chat_gpt_api/app/model/data_model/completion/completion.dart';
import 'package:flutter/material.dart';
import 'package:gee/state_management/search_request.dart';
import 'package:get/get.dart';

class ResponsePage extends StatelessWidget {
  ResponsePage({super.key, required this.query, required this.responses});
  final String query;
  final List<Choice>? responses;
  final searchManager = Get.put(SearchRequest());

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
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Obx(() => searchManager.isSearching.value
              ? const CircularProgressIndicator()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      query,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      responses != null ? responses![0].text! : '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                )),
        )),
      ),
    );
  }
}
