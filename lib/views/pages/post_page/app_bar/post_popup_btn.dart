import 'package:flutter/material.dart';

class PostPopUpButton extends StatelessWidget {
  const PostPopUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
        // 더보기 메뉴 기능
      },
    );
  }
}