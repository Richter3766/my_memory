import 'package:flutter/material.dart';
import 'package:my_memory/services/db_service.dart';
import 'package:my_memory/views/widgets/post/post_detail.dart';
import './post_item.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<PostItem>>(
      future: DatabaseHelper.instance.getAllPostItems(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!.map((postItem) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(postItem: postItem),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(postItem.title),
                  subtitle: Text(postItem.content),
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
    );
  }

}

