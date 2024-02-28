import 'package:flutter/material.dart';
import 'package:my_memory/style/colors.dart';
import 'package:my_memory/views/widgets/app_bar/profile_app_bar.dart';
import 'package:my_memory/views/widgets/body/profile_body.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      appBar: ProfileAppBar(),
      body: Column(
          children: [
            ProfileLoginBody(),
          ]
      ),
    );
  }
}
