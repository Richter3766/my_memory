import 'package:flutter/material.dart';
import 'package:my_memory/style/colors.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      scrolledUnderElevation: 0,
      title: const Text("프로필"),
      // actions:  const <Widget>[
      //   HomeSearchButton(),
      //   HomePopupMenuButton(),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}