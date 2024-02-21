import 'package:flutter/material.dart';
import 'button/calendar_btn.dart';
import './button/person_btn.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Function calendarBtnHandler;
  final Function profileBtnHandler;

  const CustomBottomAppBar({
    super.key,
    required this.calendarBtnHandler,
    required this.profileBtnHandler,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CalendarIconButton(tapHandler: calendarBtnHandler),
          const SizedBox(width: 48), // FloatingActionButton의 공간을 만들기 위한 SizedBox
          PersonIconButton(tapHandler: profileBtnHandler),
        ],
      ),
    );
  }
}