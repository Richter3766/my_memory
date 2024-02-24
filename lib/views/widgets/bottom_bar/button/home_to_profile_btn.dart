import 'package:flutter/material.dart';
import 'package:my_memory/views/pages/home.dart';

class HomeToProfileButton extends StatelessWidget {
  const HomeToProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.person),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
    );
  }
}