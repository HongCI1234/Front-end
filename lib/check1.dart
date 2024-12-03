import 'package:flutter/material.dart';

class CheckScreen1 extends StatelessWidget {
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
          '자가진단 체크리스트',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1 / 15',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              '언제 어떤 일이 일어났는지 기억하지 못한다.',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 32),
            _buildButton(context, label: '자주(많이) 그렇다', score: 10),
            const SizedBox(height: 16),
            _buildButton(context, label: '간혹(약간) 그렇다', score: 5),
            const SizedBox(height: 16),
            _buildButton(context, label: '그렇지 않다', score: 0),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String label, required int score}) {
    return ElevatedButton(
      onPressed: () {
        // 점수 전달 및 다음 화면으로 이동
        Navigator.pushNamed(context, '/check2', arguments: score);
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
