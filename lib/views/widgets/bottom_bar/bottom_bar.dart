import 'package:flutter/material.dart';
import 'button/calendar_btn.dart';
import './button/person_btn.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CalendarIconButton(),
          SizedBox(width: 48), // FloatingActionButton의 공간을 만들기 위한 SizedBox
          PersonIconButton(),
        ],
      ),
    );
  }
}