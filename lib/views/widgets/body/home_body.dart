import 'package:flutter/material.dart';
import 'package:my_memory/services/db_service.dart';
import 'package:my_memory/views/pages/post_detail.dart';
import 'package:provider/provider.dart';
import '../../../models/db_state.dart';
import '../../../models/post_item.dart';
import '../../../style/colors.dart';
import '../home_list_element.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<StatefulWidget> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>{
  @override
  Widget build(BuildContext context){
    final databaseState = Provider.of<DatabaseState>(context);

    return FutureBuilder<List<PostItem>>(
      future: DatabaseHelper.instance.getAllPostItems(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!.map((postItem) {
              return InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(postItem: postItem),
                    ),
                  );
                  databaseState.refresh();
                },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: listColor,
                      border: Border.all(color: listColor, width: 2.0),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0), // 위쪽에만 패딩 적용
                      child: HomeListTile(postItem: postItem),
                    ),

                  )
              );
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('오류가 발생했습니다.'));
        } else {
          return const Center(child: Text('기억을 추가해주세요'));
        }
      },
    );
  }
}

