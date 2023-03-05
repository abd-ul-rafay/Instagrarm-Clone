import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/views/widgets/or_divider.dart';
import '../../widgets/my_blue_button.dart';
import '../../widgets/my_dialogbox.dart';
import '../../widgets/my_textfield.dart';

class LoginScreen extends StatefulWidget {
  final void Function() onTap;
  const LoginScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  void loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailEditingController.text.trim(),
        password: passwordEditingController.text.trim(),
      );
    } on FirebaseAuthException catch(e) {
      showDialogBox(context, e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    (MediaQuery.of(context).platformBrightness == Brightness.light) ?
                    'assets/icons/instagram_name_lighttheme.svg' : 'assets/icons/instagram_name_darktheme.svg',
                    height: 75.0,
                  ),
                  const SizedBox(height: 20.0,),
                  MyTextField(
                    controller: emailEditingController,
                    hintText: 'Email',
                    obscure: false,
                  ),
                  const SizedBox(height: 10.0,),
                  MyTextField(
                    controller: passwordEditingController,
                    hintText: 'Password',
                    obscure: true,
                  ),
                  const SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Forgot password?', style: TextStyle(color: Colors.blue),)
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  MyBlueButton(text: 'Log in', onTap: loginUser,),
                  const SizedBox(height: 20.0,),
                  const OrDivider(),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Continue with Facebook',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0),
                  ),
                  const SizedBox(height: 10.0,),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Create new account?', style: TextStyle(color: Colors.blue), textAlign: TextAlign.center)
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
