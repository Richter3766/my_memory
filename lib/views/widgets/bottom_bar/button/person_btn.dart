import 'package:flutter/material.dart';
import 'package:my_memory/views/pages/home.dart';

class PersonIconButton extends StatelessWidget {
  const PersonIconButton({super.key});

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