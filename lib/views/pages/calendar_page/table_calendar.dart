import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../models/post_item.dart';
import '../../../provider/calendar_day.dart';
import '../../../provider/db_state.dart';
import '../../../provider/selected_date.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<StatefulWidget> createState() => CalendarWidgetState();
}

class CalendarWidgetState extends State<CalendarWidget>{
  late final DateModel dateModel;
  late final CalendarState calendarState;
  late final DatabaseState databaseState;
  DateTime _focusedDay = DateTime.now();

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dateModel = Provider.of<DateModel>(context, listen: false);
    calendarState = Provider.of<CalendarState>(context, listen: false);
    databaseState = Provider.of<DatabaseState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      headerStyle: const HeaderStyle(
          formatButtonVisible: false),
      locale: 'ko_KR',
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2099, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(calendarState.selectedDay, day),
      onDaySelected: _onDaySelected,
      onPageChanged: _onPageChanged,
      eventLoader: _getPostsForDay,
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    dateModel.dateString = selectedDay;
    calendarState.setFocusedDay = focusedDay;
    calendarState.setSelectedDay = selectedDay;

    setState(() {
      _focusedDay = focusedDay;
    });
  }

  void _onPageChanged(DateTime focusedDay) {
    calendarState.setFocusedDay = focusedDay;
    _focusedDay = focusedDay;
    setState(() {
      _focusedDay = focusedDay;
    });
  }

  List<PostItem> _getPostsForDay(DateTime day) {
    return databaseState.selectedEvents[DateTime(day.year, day.month, day.day)] ?? [];
  }

}


