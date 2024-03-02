import 'package:path_provider/path_provider.dart';

Future<String> getLocalDatabasePath() async {
  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/memory.db';
}

Future<String> getLocalIDPath() async {
  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/id.txt';
}