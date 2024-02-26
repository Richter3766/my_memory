import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateModel extends ChangeNotifier {
  late String _date;
  late String _weekDay;

  DateModel(){
    _date = DateFormat('yy.MM.dd HH:mm').format(DateTime.now());
    _weekDay = findWeekDay(DateTime.now().weekday);
  }
  String get date => _date;
  String get weekDay => _weekDay;

  set dateString(DateTime value) {
    _date = DateFormat('yy.MM.dd HH:mm').format(value);
    _weekDay = findWeekDay(value.weekday);
    notifyListeners();
  }
  
}

String findWeekDay(int weekday){
  String koreanWeekday = "";
  
  switch (weekday) {
    case 1:
      koreanWeekday = '월요일';
      break;
    case 2:
      koreanWeekday = '화요일';
      break;
    case 3:
      koreanWeekday = '수요일';
      break;
    case 4:
      koreanWeekday = '목요일';
      break;
    case 5:
      koreanWeekday = '금요일';
      break;
    case 6:
      koreanWeekday = '토요일';
      break;
    case 7:
      koreanWeekday = '일요일';
      break;
  }
  return koreanWeekday;
}