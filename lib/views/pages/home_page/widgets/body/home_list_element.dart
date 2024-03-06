import 'package:flutter/material.dart';
import 'package:my_memory/models/post_item.dart';

import '../../../../../style/text_style.dart';
import '../../../../../utils/date_to_month_day.dart';
import 'day_month_text.dart';

class HomeListTile extends StatelessWidget {
  final PostItem postItem;
  late final String month;
  late final String day;

  HomeListTile({super.key, required this.postItem}) {
    String monthDay = dateToMonthDay(postItem.date);
    month = monthDay.split(' ')[0];
    day = "${monthDay.split(' ')[1]} ";
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: DayMonthText(day: day, month: month),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postItem.title,
            style: homeTitleStyle,
          ),
          if (postItem.content.isNotEmpty)
              Text(
                postItem.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: homeContentStyle,
              ),
        ],
      ),
    );
  }
}
