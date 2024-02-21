import 'package:flutter/material.dart';
import 'button/popup_menu_btn.dart';
import 'button/search_btn.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions:  const <Widget>[
        SearchIconButton(),
        CustomPopupMenuButton(),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}