import 'package:flutter/material.dart';
import 'package:my_memory/services/db_service.dart';
import 'package:my_memory/models/post_item.dart';

import 'post.dart';

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
            icon: const Icon(Icons.delete),
            onPressed: (){
              showDeleteConfirmDialog(context);
            },
          ),
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
              if (mounted) {
                setState(() {
                  // 상태 업데이트
                });
              }
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

  void showDeleteConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('삭제 확인'),
          content: const Text('정말 기억을 지우시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: const Text('아니오'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('네'),
              onPressed: () {
                DatabaseHelper.instance.delete(widget.postItem.id);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
