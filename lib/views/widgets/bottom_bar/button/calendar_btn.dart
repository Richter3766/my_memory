import 'package:flutter/material.dart';
import 'package:my_memory/views/pages/home.dart';

class CalendarIconButton extends StatelessWidget {
  const CalendarIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.calendar_today),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
    );
  }
}