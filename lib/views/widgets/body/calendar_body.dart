import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_memory/models/post_item.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../models/db_state.dart';
import '../../pages/post_detail.dart';

class CalendarBody extends StatefulWidget {
  const CalendarBody({super.key});

  @override
  CalendarBodyState createState() => CalendarBodyState();
}

class CalendarBodyState extends State<CalendarBody> {
  DateTime _selectedDay;
  DateTime _focusedDay;
  Map<DateTime, List<PostItem>> selectedEvents;

  CalendarBodyState()
      : _selectedDay = DateTime.now(),
        _focusedDay = DateTime.now(),
        selectedEvents = {};

  @override
  void initState() {
    super.initState();
    DatabaseState databaseState = Provider.of<DatabaseState>(context, listen: false);
    databaseState.addListener(updateEvents);

    updateEvents();
  }

  @override
  void dispose() {
    DatabaseState databaseState = Provider.of<DatabaseState>(context, listen: false);
    databaseState.removeListener(updateEvents);

    super.dispose();
  }

  Map<DateTime, List<PostItem>> convertToMap(List<PostItem> postItems) {
    Map<DateTime, List<PostItem>> map = {};

    for (PostItem item in postItems) {
      DateTime key = convertToDate(item.date);

      if (map[key] == null) {
        map[key] = [item];
      } else {
        map[key]?.add(item);
      }
    }

    return map;
  }

  DateTime convertToDate(String date) {
    return DateFormat("yy.MM.dd").parse(date);
  }

  void updateEvents() {
    DatabaseState databaseState = Provider.of<DatabaseState>(context, listen: false);
    selectedEvents = convertToMap(databaseState.postItems);
  }


  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void _onPageChanged(DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
    });
  }

  List<PostItem> _getPostsForDay(DateTime day) {
    return selectedEvents[DateTime(day.year, day.month, day.day)] ?? [];
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // SingleChildScrollView로 Column 위젯을 감쌌습니다.
      child: Column(
          children: [
            TableCalendar(
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false),
              locale: 'ko_KR',
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2099, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: _onDaySelected,
              onPageChanged: _onPageChanged,
              eventLoader: _getPostsForDay,),
            SizedBox(
                height: 300,
                child: _buildEventList()
            )
          ]
      ),
    );
  }

  Widget _buildEventList() {
    final databaseState = Provider.of<DatabaseState>(context);
    return ListView(
      children: _getPostsForDay(_selectedDay).map((postItem) {
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
            title: Text(postItem.date),
            subtitle: Text(postItem.title),
          ),
        );
      }).toList(),
    );
  }
}
