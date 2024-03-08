import 'dart:io';

import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as drive;

import '../../../main.dart';
import '../../../utils/back_up.dart';
import '../../../utils/path.dart';
import '../../common/toast_message.dart';


class BackupAndLoadWidget extends StatefulWidget {
  const BackupAndLoadWidget({super.key, required this.driveApi});
  final drive.DriveApi? driveApi;

  @override
  BackupAndLoadWidgetState createState() => BackupAndLoadWidgetState();
}

class BackupAndLoadWidgetState extends State<BackupAndLoadWidget> {
  late String lastModified;

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TextButton(
          onPressed: _handleSaveBackUp,
          child: const Text("백업하기"),
        ),
        TextButton(
          onPressed: () async {
            await _handleLoadBackUp();
            restartWidgetKey.currentState!.restartApp();
          },
          child: const Text("불러오기"),
        ),
      ],
    );
  }

  Future<void> _handleSaveBackUp() async{
    showToastMessage("백업 시작");
    String dbpath = await getLocalDatabasePath();
    File file = File(dbpath);
    String? id = await upLoad(driveApi: widget.driveApi!, file: file);
    saveFileId(id!, await getLocalIDPath());
    showToastMessage("백업 완료");
  }

  Future<void> _handleLoadBackUp() async {
    showToastMessage("불러오기 시작");
    String dbpath = await getLocalDatabasePath();
    String? id = await getFileId(await getLocalIDPath());
    await getBackUp(driveApi: widget.driveApi!, fileId: id!, destinationPath: dbpath);
    showToastMessage("불러오기 완료");
  }


}
