import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/path.dart';

class BackupDateWidget extends StatelessWidget {
  const BackupDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DateTime?>(
      future: getBackupLastModified(),
      builder: (BuildContext context, AsyncSnapshot<DateTime?> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // 로딩 중일 때는 프로그레스 인디케이터를 표시
        } else if(snapshot.hasError) {
          return const Text('오류가 발생했습니다.'); // 에러 발생 시 메세지 표시
        } else {
          if(snapshot.data == null) {
            return const Text('백업을 생성해주세요.'); // 백업 파일이 없을 때 메세지 표시
          } else {
            return Text('최종 백업일: ${DateFormat('20yy.MM.dd HH:mm').
            format(snapshot.data!)}'); // 백업 파일의 최종 수정일 표시
          }
        }
      },
    );
  }

  Future<DateTime?> getBackupLastModified() async {
    String dbpath = await getLocalDatabasePath();
    File file = File(dbpath);
    if(await file.exists()) {
      return await file.lastModified();
    } else {
      return null;
    }
  }
}
