import 'package:flutter/material.dart';

class ProfileBody extends StatefulWidget{
  const ProfileBody({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileBodyState();

}

class _ProfileBodyState extends State<ProfileBody>{
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Text("테스트용"),
    );
  }

}