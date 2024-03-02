import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;

import '../client/google_auth_client.dart';
import 'package:path/path.dart' as path;

Future<drive.DriveApi?> getDriveApi(
    GoogleSignInAccount googleSignInAccount) async {
  final header = await googleSignInAccount.authHeaders;
  GoogleAuthClient googleAuthClient = GoogleAuthClient(header: header);
  return drive.DriveApi(googleAuthClient);
}


//upLoad
Future<drive.File?> upLoad(
    {required drive.DriveApi driveApi,
      required File file,
      String? driveFileId}) async {
  // 드라이브 업로드용 파일 정보
  drive.File driveFile = drive.File();

  //앱에 저장된 파일 이름 추출
  driveFile.name = path.basename(file.absolute.path);

  late final drive.File response;
  if (driveFileId != null) {
    response = await driveApi.files.update(driveFile, driveFileId,
        uploadMedia: drive.Media(file.openRead(), file.lengthSync()));
  } else {
    driveFile.parents = ["appDataFolder"];
    response = await driveApi.files.create(driveFile,
        uploadMedia: drive.Media(file.openRead(), file.lengthSync()));
  }
  return response;
}