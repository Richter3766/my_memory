import 'package:flutter/material.dart';

class HomePopupMenuButton extends StatelessWidget {
  const HomePopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        // TODO: 메뉴 선택 이벤트
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'back_up',
            child: Text('백업하기'),
          ),
          const PopupMenuItem<String>(
            value: 'sort_by',
            child: Text('정렬'),
          ),
        ];
      },
    );
  }
}