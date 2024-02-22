import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../views/widgets/post/post_item.dart';

class DatabaseHelper {
  static const _databaseName = "memory.db";
  static const _databaseVersion = 1;

  static const table = 'post';

  static const columnId = '_id';
  static const columnTitle = 'title';
  static const columnContent = 'content';

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
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnTitle TEXT NOT NULL DEFAULT "제목없음",
            $columnContent TEXT NOT NULL DEFAULT "빈 내용"
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<int> update(PostItem item) async {
    Database db = await instance.database;

    return await db.update(
      table,
      item.toMap(),
      where: '$columnId = ?',
      whereArgs: [item.id],
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
      ) async {
    var titleText = titleController.text;
    var contentText = contentController.text;

    if (postItem == null) {
      // id가 없으면 새로운 PostItem을 추가
      await DatabaseHelper.instance.insert({
        DatabaseHelper.columnTitle: titleText,
        DatabaseHelper.columnContent: contentText,
      });
    } else {
      // id가 있으면 기존의 PostItem을 수정
      await DatabaseHelper.instance.update(postItem);
    }
  }

  Future<List<PostItem>> getAllPostItems() async {
    var rows = await queryAllRows();
    List<PostItem> postItems = rows.map((row) => PostItem(
        id: row[columnId],
        title: row[columnTitle],
        content: row[columnContent]
    )).toList();
    return postItems;
  }

}
