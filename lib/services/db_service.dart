
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/post_item.dart';

class DatabaseHelper {
  static const _databaseName = "memory.db";
  static const _databaseVersion = 1;

  static const table = 'post';

  static const columnId = '_id';
  static const columnTitle = 'title';
  static const columnContent = 'content';
  static const columnDate = 'date';

  // DatabaseHelper 클래스를 싱글톤으로 만들기
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnTitle TEXT NOT NULL DEFAULT "이름 없는 기억",
            $columnContent TEXT NOT NULL DEFAULT "",
            $columnDate TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<Map<String, Object?>> select(int id) async {
    Database db = await instance.database;
    final result = await db.query(
        table,
        where: '_id = ?',
        whereArgs: [id]
    );
    if (result.isNotEmpty) {
      return result.first; // 첫 번째 요소 반환
    } else {
      throw Exception('No record found with id: $id');
    }
  }

  Future<int> update(int id, String title, String content, String date) async {
    Database db = await instance.database;

    return await db.update(
      table,
      {'title': title,
        'content': content,
        'date' : date},
      where: '_id = ?',
      whereArgs: [id],
    );
  }
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<dynamic> savePost(
      TextEditingController titleController,
      TextEditingController contentController,
      PostItem? postItem,
      String date
      ) async {
    var titleText = titleController.text;
    var contentText = contentController.text;

    if (titleText == ""){
      titleText = "이름 없는 기억";
    }

    if (postItem == null) {
      // id가 없으면 새로운 PostItem을 추가
      await DatabaseHelper.instance.insert({
        DatabaseHelper.columnTitle: titleText,
        DatabaseHelper.columnContent: contentText,
        DatabaseHelper.columnDate: date
      });
    } else {
      // id가 있으면 기존의 PostItem을 수정
      await DatabaseHelper.instance
          .update(postItem.id, titleText, contentText, date);
    }
  }

  Future<List<PostItem>> getAllPostItems() async {
    var rows = await queryAllRows();
    List<PostItem> postItems = rows.map((row) => PostItem(
        id: row[columnId],
        title: row[columnTitle],
        content: row[columnContent],
        date: row[columnDate],
    )).toList().reversed.toList();
    return postItems;
  }
  Future<void> delete(int id) async{
    Database db = await instance.database;
    await db.delete(
      table,
      where: '_id = ?',
      whereArgs: [id],
    );
  }

}
