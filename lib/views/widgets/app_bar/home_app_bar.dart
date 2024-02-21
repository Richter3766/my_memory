import 'package:flutter/material.dart';
import '../app_bar/popup_menu_btn.dart';
import '../app_bar/search_btn.dart';

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