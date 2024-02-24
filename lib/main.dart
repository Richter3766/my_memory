import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_memory/views/pages/home.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  runApp(const HomePage());
}