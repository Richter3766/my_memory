import 'package:flutter/material.dart';
import 'package:my_memory/views/pages/post_page.dart';

class HomeToPostButton extends StatelessWidget {
  const HomeToPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PostPage()),
      )
    );
  }
}
