import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '프로필',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 사용자 사진 (임시로 사람 아이콘)
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blueAccent,
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // 이름, 성별, 생년월일
            Text(
              '김숙명', // 임시 이름
              style:
                  GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '성별: 여성', // 임시 성별
              style: GoogleFonts.lato(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '생년월일: 1990년 01월 01일', // 임시 생년월일
              style: GoogleFonts.lato(fontSize: 18),
            ),
            const SizedBox(height: 32),

            // 데이터프레임 예시
            Text(
              '2024년 11월 데이터',
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // DataTable 예시
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('날짜')),
                  DataColumn(label: Text('활동 칼로리')),
                  DataColumn(label: Text('수면 시간')),
                  DataColumn(label: Text('인지 점수')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('2024-11-01')),
                    DataCell(Text('300 kcal')),
                    DataCell(Text('7 시간')),
                    DataCell(Text('85 점')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2024-11-02')),
                    DataCell(Text('320 kcal')),
                    DataCell(Text('6.5 시간')),
                    DataCell(Text('87 점')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2024-11-03')),
                    DataCell(Text('310 kcal')),
                    DataCell(Text('7.2 시간')),
                    DataCell(Text('86 점')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2024-11-04')),
                    DataCell(Text('330 kcal')),
                    DataCell(Text('6.8 시간')),
                    DataCell(Text('88 점')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2024-11-05')),
                    DataCell(Text('315 kcal')),
                    DataCell(Text('7 시간')),
                    DataCell(Text('85 점')),
                  ]),
                  // 추가적인 데이터 행은 필요에 따라 더 추가할 수 있습니다.
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
