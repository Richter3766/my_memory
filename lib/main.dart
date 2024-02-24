import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_memory/views/pages/home.dart';
import 'package:provider/provider.dart';

import 'models/db_state.dart';
import 'models/selected_date.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DateModel()),
        ChangeNotifierProvider(create: (context) => DatabaseState()..refresh()),
      ],
      child: const HomePage(),
    ),
  );
}