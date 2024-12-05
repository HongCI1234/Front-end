import 'package:flutter/material.dart';
import 'services/openai_service.dart';

class ChatbotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final OpenAIService _openAIService = OpenAIService(); // OpenAIService 인스턴스 생성
  final TextEditingController _controller = TextEditingController(); // 입력 컨트롤러
  final List<Map<String, String>> _messages = []; // 메시지 저장 리스트

  void _sendMessage() async {
    final message = _controller.text.trim(); // 사용자 입력값 가져오기
    if (message.isEmpty) return; // 빈 메시지는 무시

    // 사용자 메시지 추가
    setState(() {
      _messages.add({'role': 'user', 'content': message});
    });

    _controller.clear(); // 입력 필드 초기화

    try {
      // OpenAI로부터 응답 가져오기
      final response = await _openAIService.createModel(message);

      // 챗봇 응답 추가
      setState(() {
        _messages.add({'role': 'assistant', 'content': response});
      });
    } catch (error) {
      // 에러 발생 시 메시지 추가
      setState(() {
        _messages.add({
          'role': 'assistant',
          'content': 'An error occurred while communicating with the chatbot.'
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마가톡'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // 메시지 표시 영역
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['role'] == 'user';
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message['content']!,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // 입력 및 전송 버튼
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // 입력 필드
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                // 전송 버튼
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
