import 'package:asdl/screens/home_screen.dart';
import 'package:asdl/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class landingPage extends StatefulWidget {

  static final String id = 'landing_page';

  @override
  _landingPageState createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {

  User _user;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    User user = await FirebaseAuth.instance.currentUser;
    _updateUser(user);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return loginScreen(
        onSignIn: _updateUser,
      );
    }
    return homePage(
//      onSignOut: () => _updateUser(null),
    );
  }
}
