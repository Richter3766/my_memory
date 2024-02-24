import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/db_state.dart';
import '../../../../models/selected_date.dart';
import '../../../../services/db_service.dart';
import '../../../../models/post_item.dart';

class PostSaveButton extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final PostItem? postItem;
  const PostSaveButton({super.key,
    required this.titleController,
    required this.contentController,
    this.postItem});

  @override
  Widget build(BuildContext context) {
    DateModel model = Provider.of<DateModel>(context);
    var databaseState = Provider.of<DatabaseState>(context);
    return ElevatedButton(
      onPressed: () {DatabaseHelper.instance
          .savePost(titleController, contentController, postItem, model.date)
          .then((result){
        // Navigator.pushReplacementNamed(context, '/home');
        Navigator.pop(context);
          });
        databaseState.refresh();
        },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue
      ),
      child: const Text('SAVE'),
    );
  }
}