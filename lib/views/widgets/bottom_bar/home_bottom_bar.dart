import 'package:flutter/material.dart';
import 'button/home_to_calendar_btn.dart';
import './button/home_to_profile_btn.dart';

class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({
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
          HomeToCalendarIconButton(),
          SizedBox(width: 48), // FloatingActionButton의 공간을 만들기 위한 SizedBox
          HomeToProfileButton(),
        ],
      ),
    );
  }
}