import 'package:chat_gpt_api/app/chat_gpt.dart';
import 'package:chat_gpt_api/app/model/data_model/completion/completion.dart';
import 'package:chat_gpt_api/app/model/data_model/completion/completion_request.dart';
import 'package:gee/api_key.dart';
import 'package:get/get.dart';

class SearchRequest extends GetxController {
  final _chatGptClient = ChatGPT.builder(token: ApiKey.apiKey);

  Future<Completion> makeSearch(String userPrompt) async {
    isSearching(true);
    Completion? response = await _chatGptClient.textCompletion(
        request: CompletionRequest(prompt: userPrompt, maxTokens: 256));

    isSearching(false);

    return response!;
  }

  var isSearching = false.obs;
}
