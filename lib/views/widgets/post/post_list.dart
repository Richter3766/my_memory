import 'package:flutter/material.dart';
import './post_item.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: 실제 데이터와 연동
    return ListView(
      children: const <Widget>[
        PostItem(date: '21 Feb', content: 'Draft', moodIcon: Icons.sentiment_satisfied),
        PostItem(date: '20 Feb', content: '오늘의 1년이 고민 됐어', moodIcon: Icons.sentiment_dissatisfied),
        // 추가 게시물
      ],
    );
  }
}