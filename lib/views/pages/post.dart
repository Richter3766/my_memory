import 'package:flutter/material.dart';
import 'package:my_memory/views/widgets/post/post_item.dart';

import '../../services/db_service.dart';
import '../widgets/app_bar/post_app_bar.dart';
import '../widgets/post/post_body.dart';

class PostPage extends StatefulWidget{
  final PostItem? postItem;

  const PostPage({super.key, this.postItem});

  @override
  State<StatefulWidget> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController contentController = TextEditingController();

    return PopScope(
      onPopInvoked: (bool pop) async {
        if (pop) {DatabaseHelper.instance
              .savePost(titleController, contentController, widget.postItem)
              .then((result){
          Navigator.pushReplacementNamed(context, '/home');
          });
        }
      },
      child: Scaffold(
        appBar: PostAppBar(
            titleController: titleController,
            contentController: contentController),

        body: PostBody(
            titleController: titleController,
            contentController: contentController,
          postItem: widget.postItem,
        ),
      ),
    );
  }
}