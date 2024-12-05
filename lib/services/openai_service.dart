import 'package:dart_openai/dart_openai.dart';

class OpenAIService {
  final String apiKey =
      'api_key'; // OpenAI API 키 직접 입력

  Future<String> createModel(String sendMessage) async {
    // OpenAI API 키 설정
    OpenAI.apiKey = apiKey;

    // API 요청 타임아웃 설정
    OpenAI.requestsTimeOut = const Duration(seconds: 60);

    // 시스템 메시지 정의 (컨텍스트 설정)
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "You're a psychological consultant.",
        ),
      ],
      role: OpenAIChatMessageRole.system,
    );

    // 사용자 메시지 정의
    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          sendMessage,
        ),
      ],
      role: OpenAIChatMessageRole.user,
    );

    // 요청 메시지 리스트 생성
    final requestMessages = [
      systemMessage,
      userMessage,
    ];

    try {
      // OpenAI API 요청
      OpenAIChatCompletionModel chatCompletion =
          await OpenAI.instance.chat.create(
        model: 'gpt-3.5-turbo',
        messages: requestMessages,
        maxTokens: 250,
      );

      // 응답 메시지 추출 및 반환
      String message =
          chatCompletion.choices.first.message.content![0].text.toString();
      return message;
    } catch (e) {
      // 예외 발생 시 오류 메시지 반환
      print("Error occurred: $e");
      return "Failed to get a response from OpenAI.";
    }
  }
}
