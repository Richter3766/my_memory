import 'package:flutter/material.dart';
import 'package:my_memory/models/post_item.dart';

Widget getListTile(PostItem postItem){
  return ListTile(
      title: Text(
        postItem.date,
        style: const TextStyle(
          fontSize: 20.0, // 여기서 날짜의 폰트 크기를 조절합니다.
          fontWeight: FontWeight.bold, // 여기서 날짜의 폰트 두께를 조절합니다.
        ),
      ),

      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postItem.title,
            style: const TextStyle(
              fontSize: 18.0, // 여기서 제목의 폰트 크기를 조절합니다.
              fontWeight: FontWeight.normal, // 여기서 제목의 폰트 두께를 조절합니다.
            ),
          ),
          Text(
            postItem.content,
            maxLines: 2, // 여기서 내용을 최대 2줄로 제한합니다.
            overflow: TextOverflow.ellipsis, // 긴 텍스트를 잘라내고 '...'으로 표시합니다.
            style: const TextStyle(
              fontSize: 16.0, // 여기서 내용의 폰트 크기를 조절합니다.
              fontWeight: FontWeight.normal, // 여기서 내용의 폰트 두께를 조절합니다.
            ),
          ),
        ],
      ),
    );
}