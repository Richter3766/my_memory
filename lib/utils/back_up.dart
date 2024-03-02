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
Future<String?> upLoad(
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
  return response.id;
}

Future<void> getBackUp({
  required drive.DriveApi driveApi,
  required String fileId,
  required String destinationPath,
}) async {
  drive.Media  response = await driveApi.files.
  get(fileId, downloadOptions: drive.DownloadOptions.fullMedia) as drive.Media;
  final file = File(destinationPath);
  final sink = file.openWrite();
  response.stream.pipe(sink);
}

// 파일 ID를 로컬 파일에 저장하는 함수
Future<void> saveFileId(String fileId, String filePath) async {
  final file = File(filePath);
  await file.writeAsString(fileId);
}

// 로컬 파일에서 파일 ID를 가져오는 함수
Future<String?> getFileId(String filePath) async {
  try {
    final file = File(filePath);
    return await file.readAsString();
  } catch (e) {
    // 파일을 읽는데 실패할 경우 예외처리를 합니다.
    print('An error occurred while reading the file ID: $e');
    return null;
  }
}

void writeFile(String filePath, List<int> contents) {
  final file = File(filePath);
  file.writeAsBytesSync(contents, mode: FileMode.write);
}