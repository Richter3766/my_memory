import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_memory/views/restart_widget.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  runApp(RestartWidget(key: restartWidgetKey, rootWidget: const MyMemory()));
}

final GlobalKey<RestartWidgetState> restartWidgetKey = GlobalKey<RestartWidgetState>();