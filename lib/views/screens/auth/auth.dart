import 'package:flutter/material.dart';
import 'package:instagram_clone/views/screens/auth/login.dart';
import 'package:instagram_clone/views/screens/auth/signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _showLoginScreen = true;

  void toggleScreen() {
    setState(() {
      _showLoginScreen = !_showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {

    return (_showLoginScreen)? LoginScreen(onTap: toggleScreen,) : SignUpScreen(onTap: toggleScreen,);
  }
}
