import 'package:flutter/material.dart';
import 'package:my_memory/views/pages/post.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostPage()),
      )
    );
  }
}
