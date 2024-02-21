import 'package:flutter/material.dart';

class PersonIconButton extends StatelessWidget {
  final Function tapHandler;

  const PersonIconButton({super.key, required this.tapHandler});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.person),
      onPressed: () => tapHandler(),
    );
  }
}