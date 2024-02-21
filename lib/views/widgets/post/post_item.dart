import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String date;
  final String content;
  final IconData moodIcon;

  const PostItem({super.key, required this.date, required this.content, required this.moodIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(date),
      subtitle: Text(content),
      trailing: Icon(moodIcon),
    );
  }
}