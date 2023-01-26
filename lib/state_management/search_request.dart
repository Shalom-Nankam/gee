import 'package:chat_gpt_api/app/chat_gpt.dart';
import 'package:chat_gpt_api/app/model/data_model/completion/completion.dart';
import 'package:chat_gpt_api/app/model/data_model/completion/completion_request.dart';
import 'package:gee/api_key.dart';
import 'package:get/get.dart';

///Manages the state of the app when making a request to ChatGPT
class SearchRequest extends GetxController {
  final _chatGptClient = ChatGPT.builder(token: ApiKey.apiKey);

  Future<Completion> makeSearch(String userPrompt) async {
    isSearching(true);
    Completion? response = await _chatGptClient.textCompletion(
        request: CompletionRequest(prompt: userPrompt, maxTokens: 256));

    isSearching(false);

    return response!;
  }

  ///Whether the user is currently making a search now or not
  var isSearching = false.obs;

  ///The search text the user is trying to make
  var searchQuery = ''.obs;
}
