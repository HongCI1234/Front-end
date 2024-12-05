import 'package:flutter/material.dart';

class CheckScreen6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int previousScore = ModalRoute.of(context)!.settings.arguments as int;

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
              '6 / 15',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              '약속을 해놓고 잊는다.',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 32),
            _buildButton(context,
                label: '자주(많이) 그렇다', score: 10, previousScore: previousScore),
            const SizedBox(height: 16),
            _buildButton(context,
                label: '간혹(약간) 그렇다', score: 5, previousScore: previousScore),
            const SizedBox(height: 16),
            _buildButton(context,
                label: '그렇지 않다', score: 0, previousScore: previousScore),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String label, required int score, required int previousScore}) {
    return ElevatedButton(
      onPressed: () {
        final int totalScore = previousScore + score;
        Navigator.pushNamed(context, '/check7', arguments: totalScore);
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