import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey =
      'sk-P5tRBlfKWpT5UGhAIlKK_2FH454y8xPzFtBMKKSmTwT3BlbkFJQ7YlrYFHykEin8dpch_TO_I_CNd-aXbW0MvF-h2oAA';

  Future<String> sendMessage(String message) async {
    const apiUrl = 'https://api.openai.com/v1/chat/completions';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-4', // 사용할 모델
        'messages': [
          {'role': 'user', 'content': message},
        ],
        'max_tokens': 150,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('Failed to fetch response from OpenAI');
    }
  }
}
