import 'package:flutter/material.dart';
import 'package:my_memory/services/db_service.dart';
import 'package:my_memory/views/widgets/post/post_item.dart';

import '../../pages/post.dart';

class DetailPage extends StatefulWidget {
  final PostItem postItem;

  const DetailPage({super.key, required this.postItem});

  @override
  State<StatefulWidget> createState() => _DetailPageState();

}
class _DetailPageState extends State<DetailPage> {
  late Future<PostItem> futurePostItem;

  Future<PostItem> loadPostItem() async {
    final map = await DatabaseHelper.instance.select(widget.postItem.id);
    return PostItem(
      id: map['_id'] as int,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  @override
  void initState() {
    super.initState();
    futurePostItem = loadPostItem();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PostItem>(
      future: futurePostItem,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return buildScaffold(snapshot.data!);
        }
      },
    );
  }

  Scaffold buildScaffold(PostItem postItem) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postItem.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostPage(postItem: postItem),
                ),
              );
              futurePostItem = loadPostItem();
              setState(() {});
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Text(postItem.title, style: const TextStyle(fontSize: 20)),
          Text(postItem.content),
        ],
      ),
    );
  }
}
