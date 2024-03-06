import 'package:flutter/material.dart';

import '../../../../../models/db_state.dart';
import '../../../../../models/post_item.dart';
import '../../../../../services/db_service.dart';
import '../../../../../style/colors.dart';
import '../../../post_detail_page/post_detail.dart';
import 'home_list_element.dart';

class HomeMemoryList extends StatelessWidget {
  final DatabaseState databaseState;

  const HomeMemoryList({super.key, required this.databaseState});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<PostItem>>(
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
                      padding: const EdgeInsets.only(top: 5.0),
                      child: HomeListTile(postItem: postItem),
                    ),
                  ),
                );
              }).toList(),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('오류가 발생했습니다.'));
          } else {
            return const Center(child: Text('기억을 추가해주세요'));
          }
        },
      ),
    );
  }

}