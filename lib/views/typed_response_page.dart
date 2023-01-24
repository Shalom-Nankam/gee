import 'package:chat_gpt_api/app/model/data_model/completion/completion.dart';
import 'package:flutter/material.dart';
import 'package:gee/state_management/search_request.dart';
import 'package:get/get.dart';

class TypedResponsePage extends StatefulWidget {
  const TypedResponsePage({
    super.key,
    required this.query,
  });
  final String query;

  @override
  State<TypedResponsePage> createState() => _TypedResponsePageState();
}

class _TypedResponsePageState extends State<TypedResponsePage> {
  final searchManager = Get.put(SearchRequest());

  late Future<Completion> queryResponse;

  @override
  void initState() {
    queryResponse = searchManager.makeSearch(widget.query);
    super.initState();
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
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.query,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: queryResponse,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!.choices != null
                          ? snapshot.data!.choices![0].text!
                          : '',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
