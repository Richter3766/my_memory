import 'package:flutter/material.dart';

import '../../../../../style/text_style.dart';

class DayMonthText extends StatelessWidget {
  final String day;
  final String month;
  final String? year;

  const DayMonthText({
    super.key,
    required this.day,
    required this.month,
    this.year
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: day,
              style: dayStyle
          ),
          TextSpan(
              text: month,
              style: monthStyle
          ),
          if (year != null)
            TextSpan(
              text: year,
              style: monthStyle
            )
        ],
      ),
    );
  }
}
