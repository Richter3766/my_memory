import 'package:flutter/material.dart';
import 'package:my_memory/models/post_item.dart';
import 'package:provider/provider.dart';

import '../../../models/selected_date.dart';

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
  late DateTime _selectedDate;
  late DateModel model;
  @override
  void initState() {
    _selectedDate = DateTime.now();
    widget.titleController.text = widget.postItem?.title ?? '';
    widget.contentController.text = widget.postItem?.content ?? '';
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model = Provider.of<DateModel>(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        model.dateString = _selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextButton(
            onPressed: () {
              _selectDate(context);
            },
            child: Text(
                "20${model.date.split(' ')[0]}",
              style: const TextStyle(
                fontSize: 24
              ),
            ),

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
