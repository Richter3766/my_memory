import 'package:flutter/material.dart';
import 'package:my_memory/style/colors.dart';
import '../widgets/body/calendar_body.dart';
import '../widgets/bottom_bar/button/home_to_post_btn.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Text('달력'),
        ),

        body: const Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CalendarBody(),
          ],
        ),
        floatingActionButton: const HomeToPostButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

}