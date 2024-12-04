import 'package:flutter/material.dart';
import 'checklist/check1.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '인지 능력 테스트',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '치매 진단 테스트',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            _buildButton(
              context,
              label: '자가진단 체크리스트',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckScreen1()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildButton(
              context,
              label: '기억력 테스트',
              onPressed: () {
                // 다른 기능으로 연결
              },
            ),
            const SizedBox(height: 32),
            const Text(
              '치매 예방 테스트',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            _buildButton(
              context,
              label: '빈칸에 들어갈 단어 맞추기',
              onPressed: () {
                // 다른 기능으로 연결
              },
            ),
            const SizedBox(height: 16),
            _buildButton(
              context,
              label: '스피드 게임',
              onPressed: () {
                // 다른 기능으로 연결
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue[100],
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
