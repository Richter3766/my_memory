import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:my_memory/models/post_item.dart';

import '../services/db_service.dart';

class DatabaseState extends ChangeNotifier {
  List<PostItem> _postItems = [];
  Map<DateTime, List<PostItem>> _selectedEvents = {};

  List<PostItem> get postItems => _postItems;
  Map<DateTime, List<PostItem>> get selectedEvents => _selectedEvents;

  void refresh() async {
    _postItems = await DatabaseHelper.instance.getAllPostItems();
    _selectedEvents = convertToMap(_postItems);
    notifyListeners(); // 상태가 변경되었음을 알립니다.
  }

  Map<DateTime, List<PostItem>> convertToMap(List<PostItem> postItems) {
    Map<DateTime, List<PostItem>> map = {};
    for (PostItem item in postItems) {
      DateTime key = convertToDate(item.date);
      if (map[key] == null) {
        map[key] = [item];
      } else {
        map[key]?.add(item);
      }
    }
    return map;
  }

  DateTime convertToDate(String date) {
    return DateFormat("yy.MM.dd").parse(date);
  }
}