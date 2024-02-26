import 'package:flutter/material.dart';

import '../../../pages/calendar.dart';

class HomeToCalendarIconButton extends StatelessWidget {
  const HomeToCalendarIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3, color: Colors.white),
          borderRadius: BorderRadius.circular(100)
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CalendarScreen()),
        );
      },

      mini: true,
      child: const Icon(Icons.calendar_today),
    );
  }
}