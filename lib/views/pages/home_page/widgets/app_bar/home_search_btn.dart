import 'package:flutter/material.dart';

class HomeSearchButton extends StatelessWidget {
  const HomeSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        // TODO: 검색 관련 이벤트
      },
    );
  }
}