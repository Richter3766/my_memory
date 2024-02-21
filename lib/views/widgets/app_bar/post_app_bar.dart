import 'package:flutter/material.dart';
import 'package:my_memory/views/widgets/app_bar/button/post_popup_btn.dart';
import 'package:my_memory/views/widgets/app_bar/button/post_save_btn.dart';

class PostAppBar extends StatelessWidget implements PreferredSizeWidget{
  const PostAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions:  const <Widget>[
        PostPopUpButton(),
        PostSaveButton()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}