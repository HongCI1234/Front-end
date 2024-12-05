import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Information Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersonalInfoPage(),
    );
  }
}

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final String name = "홍길동";  // 예시 이름
  final String gender = "남성";  // 예시 성별
  final String birthDate = "1990-01-01";  // 예시 생년월일

  String selectedMonth = "2024-12";  // 기본 선택된 달
  final List<Map<String, String>> lifeLogData = [
    {"Date": "2024-12-01", "Activity": "운동", "Calories": "200kcal", "Sleep": "7시간", "CognitionScore": "80"},
    {"Date": "2024-12-02", "Activity": "식사", "Calories": "600kcal", "Sleep": "6시간", "CognitionScore": "75"},
    {"Date": "2024-12-03", "Activity": "운동", "Calories": "250kcal", "Sleep": "8시간", "CognitionScore": "85"},
    // 추가적인 라이프로그 데이터
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('개인정보 페이지'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 개인정보 표시
            Text(
              '이름: $name',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '성별: $gender',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '생년월일: $birthDate',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),

            // 달 선택기
            Row(
              children: [
                Text("달 선택: "),
                DropdownButton<String>(
                  value: selectedMonth,
                  onChanged: (newValue) {
                    setState(() {
                      selectedMonth = newValue!;
                    });
                  },
                  items: ["2024-12", "2024-11", "2024-10"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),

            // 테이블 형태로 라이프로그 데이터 표시
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('날짜')),
                  DataColumn(label: Text('활동')),
                  DataColumn(label: Text('칼로리')),
                  DataColumn(label: Text('수면시간')),
                  DataColumn(label: Text('인지점수')),
                  DataColumn(label: Icon(Icons.add)), // 더하기 아이콘만 표시
                ],
                rows: lifeLogData.map((data) {
                  return DataRow(
                    cells: [
                      DataCell(Text(data["Date"]!)),
                      DataCell(Text(data["Activity"]!)),
                      DataCell(Text(data["Calories"]!)),
                      DataCell(Text(data["Sleep"]!)),
                      DataCell(Text(data["CognitionScore"]!)),
                      DataCell(IconButton(
                        icon: Icon(Icons.add), // 더하기 아이콘
                        onPressed: () {
                          // 확대 버튼을 눌렀을 때 처리할 코드
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("${data['Date']}의 상세정보"),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('활동: ${data["Activity"]}'),
                                    Text('칼로리: ${data["Calories"]}'),
                                    Text('수면시간: ${data["Sleep"]}'),
                                    Text('인지점수: ${data["CognitionScore"]}'),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('닫기'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      )),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
