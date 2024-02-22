import 'package:flutter/material.dart';
import 'package:my_memory/views/widgets/post/post_item.dart';

import '../../pages/post.dart';

class DetailPage extends StatelessWidget {
  final PostItem postItem;

  DetailPage({super.key, required this.postItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postItem.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostPage(postItem: postItem),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        // children:
        children: [
          Text(postItem.title),
          Text(postItem.content)
        ],
      )
    );
  }
}