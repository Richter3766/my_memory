String dateToMonthDay(String dateTime) {
  List<String> parts = dateTime.split(' ');
  String date = parts[0];

  List<String> dateParts = date.split('.');
  return "${dateParts[1]}월 ${dateParts[2]}일";
}