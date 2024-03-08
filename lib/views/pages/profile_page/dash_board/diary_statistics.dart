import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/db_state.dart';
import 'package:provider/provider.dart';

class DiaryStatisticsScreen extends StatefulWidget {
  const DiaryStatisticsScreen({super.key});

  @override
  DiaryStatisticsScreenState createState() => DiaryStatisticsScreenState();
}

class DiaryStatisticsScreenState extends State<DiaryStatisticsScreen> {
  // 이곳에 날짜 데이터가 있는 포스트 리스트를 정의하세요.
  // 예: List<DateTime> posts = [...];
  late final DatabaseState databaseState;
  late Map<String, int> postsPerDayOfWeek;

  @override
  void initState() {
    super.initState();
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    databaseState = Provider.of<DatabaseState>(context);
    postsPerDayOfWeek = calculatePostsPerDayOfWeek();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: <Widget>[
          const Text("요일별 통계",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          )
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: postsPerDayOfWeek.entries.map((entry) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(entry.value.toString()), // 포스트 개수
                    Text(entry.key), // 요일
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Map<String, int> calculatePostsPerDayOfWeek() {
    // 요일별 포스트 개수를 저장할 맵을 초기화합니다.
    Map<String, int> countMap = {
      '일': 0,
      '월': 0,
      '화': 0,
      '수': 0,
      '목': 0,
      '금': 0,
      '토': 0,
    };

    for (var post in databaseState.postItems) {
      DateFormat format = DateFormat('yy.MM.dd HH:mm');
      DateTime dateTime = format.parse(post.date);
      String dayOfWeek = getDayOfWeek(dateTime); // 날짜로부터 요일을 얻는 함수를 구현하세요.
      countMap[dayOfWeek] = countMap[dayOfWeek]! + 1;
    }

    return countMap;
  }

  String getDayOfWeek(DateTime date) {
    // DateTime 객체의 weekday 프로퍼티를 사용하여 요일을 얻습니다.
    List<String> days = ['일', '월', '화', '수', '목', '금', '토'];
    return days[date.weekday - 1];
  }

}