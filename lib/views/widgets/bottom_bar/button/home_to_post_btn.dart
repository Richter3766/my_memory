import 'package:flutter/material.dart';
import 'package:my_memory/views/pages/post_page.dart';

class HomeToPostButton extends StatelessWidget {
  const HomeToPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(100)
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PostPage()),
        ),
        child: const Icon(Icons.add),
    );
  }
}
