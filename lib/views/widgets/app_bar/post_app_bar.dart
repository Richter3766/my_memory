import 'package:flutter/material.dart';
import 'package:my_memory/views/widgets/app_bar/button/post_popup_btn.dart';
import 'package:my_memory/views/widgets/app_bar/button/post_save_btn.dart';
import 'package:my_memory/views/widgets/post/post_item.dart';

class PostAppBar extends StatelessWidget implements PreferredSizeWidget{
  final TextEditingController titleController;
  final TextEditingController contentController;
  final PostItem? postItem;

  const PostAppBar({super.key,
    required this.titleController,
    required this.contentController,
    this.postItem});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        const PostPopUpButton(),
        PostSaveButton(
          titleController: titleController,
        contentController: contentController,
          postItem: postItem,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}