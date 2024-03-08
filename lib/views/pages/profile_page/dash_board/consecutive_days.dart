import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/db_state.dart';
import 'package:provider/provider.dart';

import '../../../../style/text_style.dart';

class ConsecutiveDays extends StatefulWidget {
  const ConsecutiveDays({super.key});

  @override
  ConsecutiveDaysState createState() => ConsecutiveDaysState();
}

class ConsecutiveDaysState extends State<ConsecutiveDays> {
  late final DatabaseState databaseState;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    databaseState = Provider.of<DatabaseState>(context);
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100,
      child: Column(
        children: <Widget>[
          const Text("연속 일자",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              )
          ),
          Text("${calculateConsecutiveDays()}일",
            style: dayStyle,
          )
        ],
      ),
    );
  }

  int calculateConsecutiveDays() {
    DateFormat format = DateFormat('yy.MM.dd HH:mm');

    // 각 Post의 날짜를 DateTime으로 변환
    List<DateTime> dates = databaseState.postItems
        .map((post) => format.parse(post.date))  // 날짜 변환
        .toList();
    // 오늘 날짜를 기준으로 연속된 일자 계산
    DateTime today = DateTime.now();
    int consecutiveDays = 0;
    while (dates.any((date) => date.year == today.year && date.month == today.month && date.day == today.day)) {
      consecutiveDays++;
      today = today.subtract(const Duration(days: 1));  // 이전 날짜로 이동
    }

    return consecutiveDays;
  }
}