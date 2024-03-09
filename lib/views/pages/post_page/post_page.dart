import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_memory/models/post_item.dart';
import 'package:my_memory/style/colors.dart';
import 'package:provider/provider.dart';

import '../../../provider/db_state.dart';
import '../../../provider/selected_date.dart';
import '../../../services/db_service.dart';
import 'app_bar/post_app_bar.dart';
import 'body/post_body.dart';

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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) async {
        await _onPopInvoked();
        },
      child: Scaffold(
        backgroundColor: backgroundColor,
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
    var model = Provider.of<DateModel>(context, listen: false);
    final databaseState = Provider.of<DatabaseState>(context, listen: false);
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
                DatabaseHelper.instance
                    .savePost(
                    titleController,
                    contentController,
                    widget.postItem,
                    model.date
                ).
                then((result){
                  databaseState.refresh();
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
