import 'package:flutter/material.dart';
import 'package:my_memory/style/colors.dart';
import 'button/home_popup_menu_btn.dart';
import 'button/home_search_btn.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      actions:  const <Widget>[
        HomeSearchButton(),
        HomePopupMenuButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}