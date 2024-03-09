import 'package:flutter/material.dart';

import 'package:my_memory/views/pages/calendar_page/table_calendar.dart';

import 'calendar_event_list.dart';

class CalendarBody extends StatelessWidget {
  const CalendarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CalendarWidget(),
            EventListWidget()
          ]
      ),
    );
  }
}

