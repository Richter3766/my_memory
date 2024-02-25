import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:my_memory/models/post_item.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../models/db_state.dart';

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

  DateTime convertToDate(String date) {
    return DateFormat("yy.MM.dd").parse(date);
  }
  void updateEvents() {
    DatabaseState databaseState = Provider.of<DatabaseState>(context, listen: false);
    print(databaseState.postItems);
    selectedEvents = convertToMap(databaseState.postItems);
    print(selectedEvents);
  }

  @override
  void initState() {
    super.initState();

    // DatabaseState의 상태가 변경될 때마다 updateEvents를 호출합니다.
    DatabaseState databaseState = Provider.of<DatabaseState>(context, listen: false);
    databaseState.addListener(updateEvents);

    // 처음에도 이벤트를 업데이트합니다.
    updateEvents();
  }

  @override
  void dispose() {
    // 리스너를 해제합니다.
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

  List<PostItem> _getEventsForDay(DateTime day) {
    return selectedEvents[DateTime(day.year, day.month, day.day)] ?? [];
  }
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      headerStyle: const HeaderStyle(
          formatButtonVisible: false
      ),
      locale: 'ko_KR',
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2099, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: _onDaySelected,
      onPageChanged: _onPageChanged,
      eventLoader: _getEventsForDay,
    );
  }
}
