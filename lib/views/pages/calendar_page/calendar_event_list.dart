import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_memory/provider/calendar_day.dart';
import 'package:provider/provider.dart';

import '../../../provider/db_state.dart';
import '../../../models/post_item.dart';
import '../../../provider/selected_date.dart';
import '../post_detail_page/post_detail.dart';

class EventListWidget extends StatefulWidget {

  const EventListWidget({super.key});

  @override
  State<StatefulWidget> createState() => EventListWidgetState();
}

class EventListWidgetState extends State<EventListWidget>{
  late final DateModel dateModel;
  late final DatabaseState databaseState;
  late final CalendarState calendarState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    databaseState = Provider.of<DatabaseState>(context, listen: false);
    calendarState = Provider.of<CalendarState>(context, listen: false);
    dateModel = Provider.of<DateModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarState>(
      builder: (context, calendarState, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(getTodayText())),
            SizedBox(
              height: 300,
              child: ListView(
                children: _getPostsForDay(calendarState.selectedDay).map((postItem) {
                  return InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(postItem: postItem),
                        ),
                      );
                      databaseState.refresh();
                      },
                    child: ListTile(
                      title: Text(getTodayTime(postItem)),
                      subtitle: Text(postItem.title),
                    ),
                  );
                }).toList()
              )
            )
          ],
        );
      },
    );
  }
  String getTodayTime(PostItem postItem){
    var time = postItem.date.split(' ')[1].split(':');
    return "${time[0]}시 ${time[1]}분";
  }

  List<PostItem> _getPostsForDay(DateTime day) {
    return databaseState.selectedEvents[DateTime(day.year, day.month, day.day)] ?? [];
  }
  String getTodayText(){
    String prefix = dateModel.weekDay;
    String suffix = DateFormat(', 20yy년 MM월 dd일').format(calendarState.selectedDay);
    return prefix + suffix;
  }
}