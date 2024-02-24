import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_memory/models/post_item.dart';

import '../../services/db_service.dart';
import '../widgets/app_bar/post_app_bar.dart';
import '../widgets/body/post_body.dart';

class PostPage extends StatefulWidget{
  final PostItem? postItem;

  const PostPage({super.key, this.postItem});

  @override
  State<StatefulWidget> createState() => _PostPageState();
}
class _PostPageState extends State<PostPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) async {
        await _onPopInvoked();
        },
      child: Scaffold(
        appBar: PostAppBar(
            titleController: titleController,
            contentController: contentController,
            postItem: widget.postItem),
        body: PostBody(
          titleController: titleController,
          contentController: contentController,
          postItem: widget.postItem,
        ),
      ),
    );
  }

  Future _onPopInvoked() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('뒤로 가기'),
          content: const Text('현재 내용을 저장하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // '아니오'를 눌렀을 때의 동작
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('아니오'),
            ),
            TextButton(
              onPressed: () {
                // '예'를 눌렀을 때의 동작
                // 현재 내용을 DB에 저장하는 코드가 필요합니다.
                DatabaseHelper.instance
                    .savePost(titleController, contentController, widget.postItem).
                then((result){
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
              },
              child: const Text('예'),
            ),
          ],
        )
    );
  }
}
