import 'package:flutter/material.dart';
import 'package:my_memory/views/widgets/post/post_item.dart';

class PostBody extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final PostItem? postItem;
  const PostBody({super.key, required this.titleController,
    required this.contentController,
  this.postItem});

  @override
  State<StatefulWidget> createState() => _PostBodyState();

}

class _PostBodyState extends State<PostBody>{
  @override
  void initState() {
    widget.titleController.text = widget.postItem?.title ?? '';
    widget.contentController.text = widget.postItem?.content ?? '';
    super.initState();
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
            controller: widget.titleController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '제목',
                hintStyle: TextStyle(
                    fontSize: 20
                )

            ),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Expanded(
            child: TextField(
              maxLines: null,
              controller: widget.contentController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '여기에 자세히 써주세요'
              ),
            ),
          )
        ],
      ),
    );
  }
}
