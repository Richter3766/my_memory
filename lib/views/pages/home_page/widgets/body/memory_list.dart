import 'package:flutter/material.dart';

import '../../../../../provider/db_state.dart';
import '../../../../../models/post_item.dart';
import '../../../../../style/colors.dart';
import '../../../post_detail_page/post_detail.dart';
import 'home_list_element.dart';
import 'package:provider/provider.dart';

class HomeMemoryList extends StatelessWidget {

  const HomeMemoryList({super.key});
  @override
  Widget build(BuildContext context) {
    DatabaseState databaseState = Provider.of<DatabaseState>(context);
    List<PostItem> postItems = databaseState.postItems;

    return Expanded(
      child: ListView.builder(
        itemCount: postItems.length,
        itemBuilder: (context, index) {
          PostItem postItem = postItems[index];
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
        },
      ),
    );
  }

}