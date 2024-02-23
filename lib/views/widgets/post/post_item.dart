import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final int id;
  final String title;
  final String content;

  const PostItem({super.key,
    required this.title,
    required this.content,
    required this.id});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(content),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'columnId': id,
      'columnTitle': title,
      'columnContent': content,
    };
  }

}