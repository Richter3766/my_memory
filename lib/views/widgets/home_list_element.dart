import 'package:flutter/material.dart';
import 'package:my_memory/models/post_item.dart';

class HomeListTile extends StatelessWidget {
  final PostItem postItem;
  late final String month;
  late final String day;

  HomeListTile({super.key, required this.postItem}) {
    dateToMonthDay(postItem.date);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: day,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            TextSpan(
              text: month,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postItem.title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          if (postItem.content.isNotEmpty)
              Text(
                postItem.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
        ],
      ),
    );
  }

  void dateToMonthDay(String dateTime) {
    List<String> parts = dateTime.split(' ');
    String date = parts[0];

    List<String> dateParts = date.split('.');
    month = "${dateParts[1]}월";
    day = "${dateParts[2]}일 ";
  }
}
