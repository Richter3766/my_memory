import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final int id;
  final String title;
  final String content;
  final String date;

  const PostItem({super.key,
    required this.title,
    required this.content,
    required this.id,
    required this.date});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(date),
      subtitle: Text(title),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'columnId': id,
      'columnTitle': title,
      'columnContent': content,
      'columnDate' : date,
    };
  }

}