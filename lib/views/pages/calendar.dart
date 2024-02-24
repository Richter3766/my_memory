import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/body/calendar_body.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void _onDaySelected(DateTime day, List events, List holidays) {
  //   setState(() {
  //     _selectedEvents = events;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('달력'),
      ),
      body: const Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          CalendarBody(),
          SizedBox(height: 8.0),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: _selectedEvents.length,
          //     itemBuilder: (context, index) => Container(
          //       margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          //       decoration: BoxDecoration(
          //         border: Border.all(),
          //         borderRadius: BorderRadius.circular(12.0),
          //       ),
          //       child: ListTile(
          //         title: Text(_selectedEvents[index].toString()),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

}