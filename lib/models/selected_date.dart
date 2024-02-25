import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateModel extends ChangeNotifier {
  late String _date;

  DateModel(){
    _date = DateFormat('yy.MM.dd HH:mm').format(DateTime.now());
  }
  String get date => _date;

  set dateString(DateTime value) {
    _date = DateFormat('yy.MM.dd HH:mm').format(value);
    notifyListeners();
  }
}