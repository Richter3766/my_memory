import 'package:flutter/material.dart';
import 'package:my_memory/services/db_service.dart';
import 'package:my_memory/models/post_item.dart';
import 'package:my_memory/style/colors.dart';
import 'package:my_memory/style/text_style.dart';

import '../post_page/post_page.dart';

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
      date: map['date'] as String,
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
    String date = "20${postItem.date.split(' ')[0]}";

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: backgroundColor,
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
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(date, style: detailDateStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15,),
                child: Text(postItem.title, style: detailTitleStyle),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Text(postItem.content, style: detailContentStyle)),
            ],
          ))
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
