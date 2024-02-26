import 'package:flutter/material.dart';
import 'package:my_memory/views/pages/home.dart';

import '../../../../style/colors.dart';

class HomeToProfileButton extends StatelessWidget {
  const HomeToProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "profile",
      backgroundColor: calendarAndProfileBackgroundColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
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