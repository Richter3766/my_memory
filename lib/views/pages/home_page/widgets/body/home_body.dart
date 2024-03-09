import 'package:flutter/material.dart';
import 'package:my_memory/views/pages/home_page/widgets/body/memory_list.dart';
import 'package:my_memory/views/pages/home_page/widgets/body/home_top.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context){
    return const Column(
        children: [
          HomeTopBody(),
          HomeMemoryList()
        ]
    );
  }
}


