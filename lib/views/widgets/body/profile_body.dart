import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../button/google_login_button.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class ProfileLoginBody extends StatefulWidget{
  const ProfileLoginBody({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileLoginBodyState();
}

class _ProfileLoginBodyState extends State<ProfileLoginBody>{
  GoogleSignInAccount? _currentUser;

  @override
  void initState(){
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      setState(() {
        _currentUser = googleUser;
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
}