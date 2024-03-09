import 'package:flutter/cupertino.dart';


class CalendarState extends ChangeNotifier {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  CalendarState(){
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  DateTime get selectedDay => _selectedDay;
  DateTime get focusedDay => _focusedDay;

  set setFocusedDay(DateTime focusedDay){
    _focusedDay = focusedDay;
    notifyListeners();
  }

  set setSelectedDay(DateTime selectedDay){
    _selectedDay = selectedDay;
    notifyListeners();
  }
}