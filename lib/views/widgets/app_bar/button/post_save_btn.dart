import 'package:flutter/material.dart';

class PostSaveButton extends StatelessWidget {
  const PostSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 저장 기능
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue, // 버튼 텍스트 색상
      ),
      child: const Text('SAVE'),
    );
  }
}