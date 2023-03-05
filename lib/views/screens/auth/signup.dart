import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/models/user.dart' as model;
import '../../../utils/image_picker.dart';
import '../../widgets/my_blue_button.dart';
import '../../widgets/my_dialogbox.dart';
import '../../widgets/my_textfield.dart';
import '../../widgets/or_divider.dart';

class SignUpScreen extends StatefulWidget {
  final void Function() onTap;
  const SignUpScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailEditingController = TextEditingController();
  var bioEditingController = TextEditingController();
  var userNameEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();

  Uint8List? _file;

  @override
  void dispose() {
    emailEditingController.dispose();
    bioEditingController.dispose();
    userNameEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  getImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: [
            SimpleDialogOption(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEditingController.text.trim(),
        password: passwordEditingController.text.trim(),
      ).then((value) {
          final user = model.User(
            name: bioEditingController.text.trim(),
            email: emailEditingController.text.trim(),
            username: userNameEditingController.text.trim(),
            imageUrl: '',
          );

          final json = user.toJson();

          FirebaseFirestore.instance.collection('userDetails')
              .doc(value.user!.uid).set(json);
        }
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
                    const SizedBox(height: 10.0,),
                    SvgPicture.asset(
                      (MediaQuery.of(context).platformBrightness == Brightness.light) ?
                      'assets/icons/instagram_name_lighttheme.svg' : 'assets/icons/instagram_name_darktheme.svg',
                      height: 75.0,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Continue with Facebook',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0),
                    ),
                    const SizedBox(height: 10.0,),
                    const OrDivider(),
                    const SizedBox(height: 20.0),
                    Stack(
                      children: [
                        (_file != null)? CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.grey,
                          backgroundImage: MemoryImage(_file!),
                        ) : CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person,size: 50, color: Colors.white.withOpacity(0.80,)),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: GestureDetector(
                            onTap: ()=> getImage(context),
                            child: Container(
                              padding: const EdgeInsets.all(2.5),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                  shape: BoxShape.circle
                              ),
                              child: Center(
                                child: Icon(Icons.camera_alt, size: 20.0, color: Colors.white.withOpacity(0.80,),),
                              ),
                            ),
                          ),
                        )
                      ],

                    ),
                    const SizedBox(height: 10.0,),
                    MyTextField(
                      controller: emailEditingController,
                      hintText: 'Email',
                      obscure: false,
                    ),
                    const SizedBox(height: 10.0,),
                    MyTextField(
                      controller: userNameEditingController,
                      hintText: 'Username',
                      obscure: false,
                    ),
                    const SizedBox(height: 10.0,),
                    MyTextField(
                      controller: passwordEditingController,
                      hintText: 'Password',
                      obscure: true,
                    ),
                    const SizedBox(height: 10.0,),
                    MyTextField(
                      controller: bioEditingController,
                      hintText: 'Bio',
                      obscure: false,
                    ),
                    const SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text('Forgot password?', style: TextStyle(color: Colors.blue),)
                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    MyBlueButton(text: 'Sign up', onTap: signUp,),
                    const SizedBox(height: 20.0,),
                    const Text('By signing up, you agree to our\nTerms & Privacy Policy', textAlign: TextAlign.center),
                    const SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Already have an account?', style: TextStyle(color: Colors.blue), textAlign: TextAlign.center)
                    ),
                    const SizedBox(height: 20.0,),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
