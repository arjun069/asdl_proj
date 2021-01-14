import 'package:asdl/screens/Socialsigninbutton.dart';
import 'package:asdl/screens/google_sign_in.dart';
import 'package:asdl/screens/home_screen.dart';
import 'package:asdl/screens/sign_in_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class loginScreen extends StatefulWidget {

  static final String id = 'login_screen';
  loginScreen({@required this.onSignIn});
  final Function(User) onSignIn;

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  Future<void> _signInAnonymously() async {
    try {
      await Firebase.initializeApp();
      final authResult = await FirebaseAuth.instance.signInAnonymously();
      widget.onSignIn(authResult.user);
      print('${authResult.user.uid}');
    } catch (e) {
      print(e.toString());
    }
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.orangeAccent, Colors.redAccent],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.supervised_user_circle,
                    size: 120,
                  ),
                  SizedBox(height: 50),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w800,
                      height: 0.5,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:68.0),
                    child: SocialSignInButton(
                      assetName: 'images/google-logo.png',
                      text: 'Sign in with Google',
                      textColor: Colors.black87,
                      color: Colors.grey[300],
                      onPressed: () {
                        signInWithGoogle().then((result) {
                          if (result != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return homePage();
                                },
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  SignInButton(
                    text: 'Go anonymous',
                    textColor: Colors.black,
                    color: Colors.lime[300],
                    onPressed: _signInAnonymously,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
