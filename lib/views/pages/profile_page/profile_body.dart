import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_memory/provider/db_state.dart';
import 'package:my_memory/utils/back_up.dart';
import 'package:my_memory/views/pages/profile_page/dash_board/total_memories.dart';
import 'package:my_memory/views/pages/profile_page/back_up/profile_backup.dart';

import 'package:provider/provider.dart';

import '../../../style/text_style.dart';
import 'back_up/backup_last_modified.dart';
import 'dash_board/consecutive_days.dart';
import 'dash_board/diary_statistics.dart';
import 'google_login_button.dart';
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
  State<StatefulWidget> createState() => ProfileLoginBodyState();
}

class ProfileLoginBodyState extends State<ProfileLoginBody>{
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
          BackupAndLoadWidget(driveApi: _driveApi,),
          const BackupDateWidget(),
          const SizedBox(
            height: 100,
    ),
          const Text(
          "당신이 남긴 기억",
          style: detailDateStyle
          ),
          const TotalStatistics(),
          const ConsecutiveDays(),
          const DiaryStatisticsScreen(),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            '로그인 할래요?',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
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
        print(error);
    }
  }
}
