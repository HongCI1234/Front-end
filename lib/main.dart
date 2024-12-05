import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'report.dart';
import 'chatbot.dart';
import 'test.dart'; // 추가된 test.dart import
import 'checklist/check1.dart';
import 'checklist/check2.dart';
import 'checklist/check3.dart';
import 'checklist/check4.dart';
import 'checklist/check5.dart';
import 'checklist/check6.dart';
import 'checklist/check7.dart';
import 'checklist/check8.dart';
import 'checklist/check9.dart';
import 'checklist/check10.dart';
import 'checklist/check11.dart';
import 'checklist/check12.dart';
import 'checklist/check13.dart';
import 'checklist/check14.dart';
import 'checklist/check15.dart';
import 'checklist/check16.dart'; // 최종 결과 화면 import
import 'personal.dart'; // 추가된 personal.dart import

void main() {
  runApp(const MindGuardApp());
}

class MindGuardApp extends StatelessWidget {
  const MindGuardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/check1': (context) => CheckScreen1(),
        '/check2': (context) => CheckScreen2(),
        '/check3': (context) => CheckScreen3(),
        '/check4': (context) => CheckScreen4(),
        '/check5': (context) => CheckScreen5(),
        '/check6': (context) => CheckScreen6(),
        '/check7': (context) => CheckScreen7(),
        '/check8': (context) => CheckScreen8(),
        '/check9': (context) => CheckScreen9(),
        '/check10': (context) => CheckScreen10(),
        '/check11': (context) => CheckScreen11(),
        '/check12': (context) => CheckScreen12(),
        '/check13': (context) => CheckScreen13(),
        '/check14': (context) => CheckScreen14(),
        '/check15': (context) => CheckScreen15(),
        '/check16': (context) => CheckScreen16(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // BottomNavigationBar의 현재 인덱스
  final List<Widget> _pages = [
    HomePage(), // 홈 화면
    ReportScreen(), // 리포트 화면
    PersonalInfoPage(), // 프로필 화면
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'MindGuard',
              style: GoogleFonts.lato(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.psychology, color: Colors.blue),
          ],
        ),
        centerTitle: false,
      ),
      body: _pages[_currentIndex], // 현재 선택된 페이지 표시
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // 현재 선택된 인덱스
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // 선택된 인덱스로 변경
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '자가진단',
            style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildButton(
            context,
            icon: Icons.watch,
            label: '라이프로그 리포트',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReportScreen()),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildButton(
            context,
            icon: Icons.category,
            label: '인지 능력 테스트',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestScreen()),
              );
            },
          ),
          const SizedBox(height: 32),
          Text(
            '챗봇',
            style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildButton(
            context,
            icon: Icons.chat,
            label: '마가톡과 대화하기',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 24),
      label: Text(label, style: GoogleFonts.lato(fontSize: 16)),
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
