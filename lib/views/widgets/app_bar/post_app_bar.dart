import 'package:flutter/material.dart';
import 'package:my_memory/views/widgets/app_bar/button/post_save_btn.dart';
import 'package:my_memory/models/post_item.dart';

import '../../../style/colors.dart';

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
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: PostSaveButton(
              titleController: titleController,
              contentController: contentController,
              postItem: postItem,
            )
          )
        ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}