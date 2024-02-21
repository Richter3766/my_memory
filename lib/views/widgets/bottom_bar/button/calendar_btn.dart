import 'package:flutter/material.dart';

class CalendarIconButton extends StatelessWidget {
  final Function tapHandler;

  const CalendarIconButton({super.key, required this.tapHandler});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.calendar_today),
      onPressed: () => tapHandler(),
    );
  }
}