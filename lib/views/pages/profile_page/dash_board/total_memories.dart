import 'package:flutter/material.dart';

import '../../../../models/db_state.dart';
import 'package:provider/provider.dart';

import '../../../../style/text_style.dart';

class TotalStatistics extends StatefulWidget {
  const TotalStatistics({super.key});

  @override
  TotalStatisticsState createState() => TotalStatisticsState();
}

class TotalStatisticsState extends State<TotalStatistics> {
  // 이곳에 날짜 데이터가 있는 포스트 리스트를 정의하세요.
  // 예: List<DateTime> posts = [...];
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
          const Text("남긴 총 기억",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              )
          ),
          Text("${databaseState.postItems.length}개",
          style: dayStyle,
          )
        ],
      ),
    );
  }

}