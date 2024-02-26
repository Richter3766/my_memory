import 'package:flutter/material.dart';
import 'package:my_memory/views/pages/post_page.dart';

class HomeToPostButton extends StatelessWidget {
  const HomeToPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 70.0, // 원하는 너비 설정
        height: 70.0, // 원하는 높이 설정
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PostPage()),
          ),
          child: const Icon(Icons.add, size: 45)
    ));
  }
}
