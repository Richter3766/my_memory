import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_memory/models/db_state.dart';
import 'package:my_memory/utils/back_up.dart';

import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../../utils/path.dart';
import '../button/google_login_button.dart';
import 'package:googleapis/drive/v3.dart' as drive;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    'https://www.googleapis.com/auth/drive.appdata',
  ],
);

class ProfileLoginBody extends StatefulWidget{
  const ProfileLoginBody({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileLoginBodyState();
}

class _ProfileLoginBodyState extends State<ProfileLoginBody>{
  GoogleSignInAccount? _currentUser;
  late drive.DriveApi? _driveApi;
  late final DatabaseState databaseState;

  @override
  void initState(){
    super.initState();
    databaseState = Provider.of<DatabaseState>(context, listen: false);
    // join(directory.path, _databaseName)
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
      _currentUser = account;
      if (_currentUser != null) {
        _driveApi = await getDriveApi(_currentUser!); // driveApi를 초기화합니다.
        setState(() {}); // 필요한 UI 변경을 트리거합니다.
      }
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
  Widget _buildBody() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser!,
            ),
            title: Text(_currentUser!.displayName ?? ''),
            subtitle: Text(_currentUser!.email),
          ),
          TextButton(
            onPressed: _handleSignOut,
            child: const Text('SIGN OUT'),
          ),
          TextButton(
              onPressed: _handleSaveBackUp,
              child: const Text("백업하기")
          ),
          TextButton(
              onPressed: () async {
                await _handleLoadBackUp();
                restartWidgetKey.currentState!.restartApp();
          },
              child: const Text("불러오기")
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('로그인 할래요?'),
          GoogleSignInButton(
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      setState(() async {
        _currentUser = googleUser;
        _driveApi = await getDriveApi(_currentUser!);
        setState(() {});
      });
    } catch (error) {
      debugPrint(error as String?);
    }
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
    setState(() {
      _currentUser = null;
    });
  }

  Future<void> _handleSaveBackUp() async{
    String dbpath = await getLocalDatabasePath();
    File file = File(dbpath);
    String? id = await upLoad(driveApi: _driveApi!, file: file);
    saveFileId(id!, await getLocalIDPath());
  }

  Future<void> _handleLoadBackUp() async {

    String dbpath = await getLocalDatabasePath();
    String? id = await getFileId(await getLocalIDPath());
    await getBackUp(driveApi: _driveApi!, fileId: id!, destinationPath: dbpath);
  }
}
