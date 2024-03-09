import 'package:flutter/material.dart';
import 'package:my_memory/provider/calendar_day.dart';
import 'package:provider/provider.dart';

import '../provider/db_state.dart';
import '../provider/selected_date.dart';
import 'pages/home_page/home.dart';

class RestartWidget extends StatefulWidget {
  final Widget rootWidget;

  const RestartWidget({super.key, required this.rootWidget});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<RestartWidgetState>()!.restartApp();
  }

  @override
  RestartWidgetState createState() => RestartWidgetState();
}

class RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.rootWidget,
    );
  }
}

class MyMemory extends StatelessWidget {
  const MyMemory({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DateModel()),
        ChangeNotifierProvider(create: (context) => DatabaseState()..refresh()),
        ChangeNotifierProvider(create: (context) => CalendarState()),
      ],
      child: const HomePage(),
    );
  }
}