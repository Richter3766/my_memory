import 'package:flutter/material.dart';
import 'package:my_memory/views/pages/home.dart';

class HomeToProfileButton extends StatelessWidget {
  const HomeToProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3, color: Colors.white),
          borderRadius: BorderRadius.circular(100)
      ),
      mini: true,
      child: const Icon(Icons.person),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
    );
  }
}