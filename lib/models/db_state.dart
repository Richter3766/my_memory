import 'package:flutter/cupertino.dart';
import 'package:my_memory/models/post_item.dart';

import '../services/db_service.dart';

class DatabaseState extends ChangeNotifier {
  List<PostItem> _postItems = [];

  List<PostItem> get postItems => _postItems;

  void refresh() async {
    _postItems = await DatabaseHelper.instance.getAllPostItems();
    notifyListeners(); // 상태가 변경되었음을 알립니다.
  }
}