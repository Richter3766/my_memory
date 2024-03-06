import 'package:flutter/material.dart';

import '../../../../../style/colors.dart';
import '../../../calendar_page/calendar.dart';

class HomeToCalendarIconButton extends StatelessWidget {
  const HomeToCalendarIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "calendar",
      backgroundColor: calendarAndProfileBackgroundColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
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