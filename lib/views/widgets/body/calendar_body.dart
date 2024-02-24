import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBody extends StatefulWidget {
  const CalendarBody({super.key});

  @override
  CalendarBodyState createState() => CalendarBodyState();
}

class CalendarBodyState extends State<CalendarBody> {
  DateTime _selectedDay;
  DateTime _focusedDay;

  CalendarBodyState()
      : _selectedDay = DateTime.now(),
        _focusedDay = DateTime.now();

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
    );
  }
}
