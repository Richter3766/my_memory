import 'package:flutter/material.dart';

import '../../../pages/calendar.dart';

class HomeToCalendarIconButton extends StatelessWidget {
  const HomeToCalendarIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.calendar_today),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CalendarScreen()),
        );
      },
    );
  }
}