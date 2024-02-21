import 'package:flutter/material.dart';

class PostBody extends StatefulWidget {
  const PostBody({super.key});

  @override
  PostBodyState createState() => PostBodyState();
}

class PostBodyState extends State<PostBody>{
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(); // 컨트롤러 초기화
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose(); // 컨트롤러 해제
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButton<String>(
            items: <String>['Feb 2024', 'Mar 2024', 'Apr 2024'].map((
                String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {
              // 날짜 변경 기능
            },
          ),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
          ),
          TextField(
            controller: _contentController,
            decoration: const InputDecoration(
              hintText: 'Write more here...',
            ),
          ),
        ],
      ),);
  }
}

