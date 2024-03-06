import 'package:flutter/material.dart';
import 'package:my_memory/views/pages/home_page/widgets/body/memory_list.dart';
import 'package:my_memory/views/pages/home_page/widgets/body/home_top.dart';
import 'package:provider/provider.dart';
import '../../../../../models/db_state.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<StatefulWidget> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>{
  @override
  Widget build(BuildContext context){
    final databaseState = Provider.of<DatabaseState>(context);

    return Column(
      children: [
        const HomeTopBody(),
        HomeMemoryList(databaseState: databaseState)
      ]
    );
  }
}

