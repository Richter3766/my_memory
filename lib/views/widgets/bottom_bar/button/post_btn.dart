import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Function postBtnHandler;

  const CustomFloatingActionButton({super.key, required this.postBtnHandler});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => postBtnHandler(),
    );
  }
}
